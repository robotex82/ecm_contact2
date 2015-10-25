require 'rails_helper'

describe "Sending contact requests" do
  %w(de en).each do |locale|
    context "I'm on the contact request page" do
      before(:each) { visit ecm_contact_requests_url(:locale => locale) }

      it "I should see an input for email" do
        page.should have_selector "input#ecm_contact_request_email"
      end

      it "The nickname field should be hidden" do
        page.should have_no_selector "input#ecm_contact_request_nickname", :visible => true
      end

      context "Submitting a form" do
        before(:each) { ActionMailer::Base.deliveries = [] }

        context 'Submitting a valid form' do
          before do
            within 'form#new_ecm_contact_request' do
              fill_in 'ecm_contact_request_name',    :with => 'John Doe'
              fill_in 'ecm_contact_request_email',   :with => 'johndoe@example.com'
              fill_in 'ecm_contact_request_message', :with => 'This is a test message!'
              check 'ecm_contact_request_terms_of_service'
            end
            click_button :ecm_contact_request_submit
          end # before

          it "displays a success message" do
            page.should have_content I18n.t('ecm.contact.form.messages.delivered')
          end # it

          it "delivers an email" do
            ActionMailer::Base.deliveries.size.should eq(1)
          end # it
        end # context 'Submitting a valid form'

        context 'Submitting an invalid form' do
          before do
            # visit "/de/kontakt"
            within 'form#new_ecm_contact_request' do
              fill_in 'ecm_contact_request_name',    :with => 'John Doe'
              fill_in 'ecm_contact_request_email',   :with => 'johndoe@example.com'
              fill_in 'ecm_contact_request_message', :with => 'This is a test message!'
            end
            click_button :ecm_contact_request_submit
          end # before

          it "does not display a success message when terms of service is not checked" do
            page.should_not have_content I18n.t('ecm.contact.form.messages.delivered')
          end # it

          it "does not send an email when terms of service is not checked" do
            ActionMailer::Base.deliveries.size.should eq(0)
          end # it
        end # context 'Submitting an invalid form'

        context 'Spam protection' do
          before(:each) do
            # visit "/de/kontakt"
            within 'form#new_ecm_contact_request' do
              find("#ecm_contact_request_nickname", visible: false).set "Spam Bot"
              # page.all("input[id=ecm_contact_request_nickname]", :visible => false).first.set("Spam Bot")
              # fill_in 'ecm_contact_request_nickname', :with => 'Spam Bot'
              fill_in 'ecm_contact_request_name',     :with => 'John Doe'
              fill_in 'ecm_contact_request_email',    :with => 'johndoe@example.com'
              fill_in 'ecm_contact_request_message',  :with => 'This is a test message!'
              check 'ecm_contact_request_terms_of_service'
            end
            click_button :ecm_contact_request_submit
          end

          it "displays a success message when nickname is filled"

          # it "displays a success message when nickname is filled" do
          #   page.should have_content I18n.t('ecm.contact.form.messages.delivered')
          # end # it

          it "does not send an email when nickname is filled" do
            ActionMailer::Base.deliveries.size.should eq(0)
          end # it
        end # context 'Submitting an invalid form'
      end # context "Submitting a form"
    end # context "I'm on the contact request page"
  end # each locale
end # describe

