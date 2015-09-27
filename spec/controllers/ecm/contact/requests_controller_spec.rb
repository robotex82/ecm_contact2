require 'spec_helper'

module Ecm::Contact
  describe RequestsController do
    describe "GET index" do
      it "assigns a new contact request to @contact_request" do
        get :index
        assigns(:contact_request).should be_a(Ecm::Contact::Request)
      end # it
    end # describe "GET index"

    describe "POST create" do
      before do
        ActionMailer::Base.deliveries = []
        @attributes = {
          :name => 'John Doe',
          :email => 'john.doe@example.com',
          :message => 'This is an example message!',
          :terms_of_service => '1'
        }
      end # before

      it "should redirect to index" do
        post :create, :ecm_contact_request => @attributes
        response.should redirect_to(ecm_contact_requests_path)
      end # it

      it "should deliver an email" do
        post :create, :ecm_contact_request => @attributes
        ActionMailer::Base.deliveries.count.should eq(1)
      end # it
    end # describe "POST create"
  end
end
