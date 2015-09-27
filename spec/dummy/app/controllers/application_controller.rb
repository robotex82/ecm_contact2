class ApplicationController < ActionController::Base
  protect_from_forgery

  # Add I18n routing support
  include RailsTools::I18nController
end
