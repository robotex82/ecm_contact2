module Ecm
  module Contact
    class Engine < ::Rails::Engine
      config.to_prepare do
        Rails.application.config.assets.precompile += %w[ecm_contact.css]
      end
    end
  end
end
