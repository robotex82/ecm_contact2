module Ecm
  module Contact
    class Request < MailForm::Base
      attribute :name 
      attribute :email
      attribute :phone
      attribute :message 
      attribute :terms_of_service
      attribute :nickname,  :captcha  => true    
      
      validates :email, :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }, :presence => true # , :message => Proc.new { I18n.t("activerecord.errors.messages.invalid") }.call }
      validates :message, :presence => true # { :message => Proc.new { I18n.t("activerecord.errors.messages.empty") }.call }
      validates :name, :presence => true # { :message => Proc.new { I18n.t("activerecord.errors.messages.empty") }.call }
      validates :terms_of_service, :acceptance => true # { :message => Proc.new { I18n.t("activerecord.errors.messages.accepted") }.call }

      # Declare the e-mail headers. It accepts anything the mail method
      # in ActionMailer accepts.
      def headers
        {
          :subject => Proc.new { I18n.t('ecm.contact.request.subject', :application_name => Rails.application.class.to_s.split("::").first) }.call,
          # :to => I18n.t('ecm.contact.request.recipients'),
          :to => Ecm::Contact::Configuration.recipients[Rails.env],
          :from => %("#{name}" <#{email}>)
        }
      end   
    end
  end
end
