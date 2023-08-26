# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include ActionView::Helpers::NumberHelper

  def account
  end
end
