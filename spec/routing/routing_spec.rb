require 'rails_helper'

describe 'routing to contact request' do
  it 'routes /en/contact to ecm/contact/requests#index' do
    expect(get: '/en/contact').to route_to(
      controller: 'ecm/contact/requests',
      action: 'index',
      locale: 'en'
    )
  end

  it 'routes /de/kontakt to ecm/contact/requests#index' do
    expect(get: '/de/kontakt').to route_to(
      controller: 'ecm/contact/requests',
      action: 'index',
      locale: 'de'
    )
  end
end
