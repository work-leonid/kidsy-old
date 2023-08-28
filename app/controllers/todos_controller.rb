class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy change_status update_to_today update_to_tomorrow ]

  layout 'app' 

  # GET /todos or /todos.json
  def index
    @todos = Todo.where(status: params[:status].presence || 'incomplete').sorted_by_due_date

    @today_todos = Todo.where(due_date: Date.today, status: Todo.statuses[:incomplete])

    @all_not_today = Todo.where(status: params[:status].presence || 'incomplete')
      .where("due_date IS NULL OR due_date != ?", Date.today)
      .sorted_by_due_date
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: "Todo was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        
        format.html { redirect_to todos_path, notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_status
    old_status = @todo.status

    @todo.update(status: todo_params[:status])

    respond_to do |format|
      if old_status == 'incomplete' && @todo.complete?
        format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@todo)}_container") }
        format.html { redirect_back(fallback_location: todos_path, notice: "Updated todo status.") }
      else
        format.html { redirect_back(fallback_location: todos_path, notice: "Updated todo status.") }
      end
    end
  end

  def update_to_today
    @todo.update(due_date: Date.today)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@todo)}_container") }
      format.html { redirect_back(fallback_location: todos_path, notice: "Updated todo status.") }
    end
  end

def update_to_tomorrow
  @todo = Todo.find(params[:id])
  
  tomorrow = Time.zone.tomorrow.to_date
  @todo.update(due_date: tomorrow)
  
  respond_to do |format|
    format.html { redirect_to todos_path, notice: "Updated todo status." }
  end
end

  def not_to_today
    @todo = Todo.find(params[:id])
    @todo.update(due_date: nil)
    respond_to do |format|
      format.html { redirect_to todos_path, notice: "Updated todo status." }
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@todo)}_container") }
      format.html { redirect_to todos_url, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def todo_params
    params.require(:todo).permit(:title, :description, :status, :due_date)
  end
end
