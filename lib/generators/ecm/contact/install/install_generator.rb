module Ecm
  module Contact
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the intializer"

        source_root File.expand_path('../templates', __FILE__) 
        
        def generate_intializer
          copy_file "ecm_contact.rb", "config/initializers/ecm_contact.rb"
        end   
      end
    end
  end
end        
