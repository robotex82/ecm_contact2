module Ecm
  module Contact
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc 'Generates the locales'

        source_root File.expand_path('../../../../../../config/locales', __FILE__)

        def generate_intializer
          copy_file 'ecm.contact.de.yml', 'config/locales/ecm.contact.de.yml'
          copy_file 'ecm.contact.en.yml', 'config/locales/ecm.contact.en.yml'

          copy_file 'ecm.contact.request.de.yml', 'config/locales/ecm.contact.request.de.yml'
          copy_file 'ecm.contact.request.en.yml', 'config/locales/ecm.contact.request.en.yml'
        end
      end
    end
  end
end
