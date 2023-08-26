class ApplicationController < ActionController::Base
  include Pagy::Backend

  def parse_yaml(file)
    YAML::load(File.open(file))
  end
end
