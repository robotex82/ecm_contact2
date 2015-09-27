module Ecm
  module Contact
    class Routing
      def self.routes(router, options = {})
        options.reverse_merge!(
          { :contact_request_actions => [:index, :create] }
        )
        
        router.resources :ecm_contact_requests, :only => options[:contact_request_actions], :controller => 'ecm/contact/requests' 
      end
    end
  end
end    
