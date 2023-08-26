class StaticController < ApplicationController

  layout 'app' 

  def affirmations
    @affirmations = parse_yaml("#{Rails.root.to_s}/static_data/affirmations.yml")
  end
end
