# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with:  :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    added_attrs = [:photo]
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
    end

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end
end
