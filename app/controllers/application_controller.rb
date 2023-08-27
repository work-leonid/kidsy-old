class ApplicationController < ActionController::Base
  before_action :set_today_todos

  include Pagy::Backend

  def parse_yaml(file)
    YAML::load(File.open(file))
  end

  private

  def set_today_todos 
    @today_todos = Todo.where(due_date: Date.today, status: Todo.statuses[:incomplete])
  end

end
