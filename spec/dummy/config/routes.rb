Rails.application.routes.draw do
  localized do
    Ecm::Contact::Routing.routes(self)
  end
end
