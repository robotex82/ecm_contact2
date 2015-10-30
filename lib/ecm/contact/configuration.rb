require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module Contact
    module Configuration
      def configure
        yield self
      end
      mattr_accessor :input_name_css_classes do
         'form-control'
      end

      mattr_accessor :input_email_css_classes do
         'form-control'
      end

      mattr_accessor :input_phone_css_classes do
         'form-control'
      end

      mattr_accessor :input_message_css_classes do
         'form-control'
      end

      mattr_accessor :input_terms_of_service_css_classes do
         ''
      end

      mattr_accessor :recipients do
        {}
      end

      mattr_accessor :base_controller do
        'ApplicationController'
      end

      mattr_accessor :additional_contact_information do
        nil
      end

      def recipients=(recipients)
        @@recipients = HashWithIndifferentAccess.new(recipients)
      end
    end
  end
end
