require 'spec_helper'

describe "routing to contact request" do
  it "routes /en/contact to ecm/contact/requests#index" do
    expect(:get => "/en/contact").to route_to(
      :controller => "ecm/contact/requests",
      :action => "index",
      :i18n_locale => "en"
    )
  end

  it "routes /de/kontakt to ecm/contact/requests#index" do
    expect(:get => "/de/kontakt").to route_to(
      :controller => "ecm/contact/requests",
      :action => "index",
      :i18n_locale => "de"
    )
  end
end
