Ecm::Contact::Engine.routes.draw do
  localized do
    scope :ecm_contact do
      resources :contact_requests, only: [:create, :index]
      root to: 'contact_requests#index'
    end
  end
end
