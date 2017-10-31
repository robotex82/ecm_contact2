module Ecm
  module Contact
    class ContactRequestsController < Ecm::Contact::Configuration.base_controller.constantize
      before_action :initialize_resource, only: [:index, :new]
      before_action :initialize_resource_for_create, only: [:create]

      respond_to :html
      responders :flash

      def self.resource_class
        Ecm::Contact::ContactRequest
      end

      def index
        new
        render :new
      end

      def new; end

      def create
        @resource.ip_address = request.remote_ip
        if @resource.save
          respond_with @resource, location: after_create_url
        else
          respond_with @resource
        end
      end

      private

      def initialize_resource_for_create
        @resource = initialize_scope.new(permitted_params)
      end

      def initialize_resource
        @resource = initialize_scope.new
      end

      def initialize_scope
        resource_class
      end

      def resource_class
        self.class.resource_class
      end

      def permitted_params
        params.require(:contact_request).permit(:nickname, :name, :email, :phone, :message, :accept_terms_of_service)
      end

      def after_create_url
        Ecm::Contact::Configuration.after_create_url.call(self)
      end

      # def index
      #   @title = I18n.t('ecm.contact.request.index.title')
      #   @contact_request = ContactRequest.new
      # end

      # def create
      #   @title = I18n.t('ecm.contact.request.index.title')
      #   @contact_request = ContactRequest.new(permitted_params)

      #   if @contact_request.deliver
      #     redirect_to(after_create_url, notice: -> { I18n.t('ecm.contact.form.messages.delivered') }.call)
      #   else
      #     render :index
      #   end
      # end
    end
  end
end
