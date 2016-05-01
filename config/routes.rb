Ecm::Contact::Engine.routes.draw do
  resources :contact_requests, only: [:create, :new]
end
