module Ecm
  module Contact
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
