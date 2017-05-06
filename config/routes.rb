Ecm::Contact::Engine.routes.draw do
  localized do
    resources :contact_requests, only: [:create, :index]
  end
end
