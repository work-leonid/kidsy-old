class JournalItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_journal_item, only: %i[ show edit update destroy ]

  layout 'app' 

  # GET /journal_items or /journal_items.json
  def index
    @pagy, @journal_items = pagy JournalItem.order("published_at DESC NULLS LAST")

if params[:month].present?
    selected_month = params[:month].to_i
    @journal_items = @journal_items.where("EXTRACT(MONTH FROM published_at ) = ?", selected_month)
@current_month_name = Date::MONTHNAMES[selected_month]
  elsif Time.now
    current_month = Time.now.month
    @journal_items = @journal_items.where("EXTRACT(MONTH FROM published_at ) = ?", current_month)
@current_month_name = Date::MONTHNAMES[current_month]
  end
  end

  # GET /journal_items/1 or /journal_items/1.json
  def show
  end

  # GET /journal_items/new
  def new
    @journal_item = JournalItem.new
    render layout: "layouts/full"
  end

  # GET /journal_items/1/edit
  def edit
  end

  # POST /journal_items or /journal_items.json
  def create
    @journal_item = JournalItem.new(journal_item_params)

    respond_to do |format|
      if @journal_item.save
        format.html { redirect_to journal_items_path, notice: "Journal item was successfully created." }
#        format.html { redirect_to journal_item_url(@journal_item), notice: "Journal item was successfully created." }
        format.json { render :show, status: :created, location: @journal_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journal_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journal_items/1 or /journal_items/1.json
  def update
    respond_to do |format|
      if @journal_item.update(journal_item_params)
        format.html { redirect_to journal_items_path, notice: "Journal item was successfully updated." }
        format.json { render :show, status: :ok, location: @journal_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journal_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_items/1 or /journal_items/1.json
  def destroy
    @journal_item.destroy

    respond_to do |format|
      format.html { redirect_to journal_items_url, notice: "Journal item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal_item
      @journal_item = JournalItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def journal_item_params
      params.require(:journal_item).permit(:body, :published_at, :title, pictures: [])
    end
end
