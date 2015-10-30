Rails.application.routes.draw do
  localized do
    Ecm::Contact::Routing.routes(self)

    root to: 'ecm/contact/requests#index'
  end
end
