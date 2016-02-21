class Ecm::Contact::RequestsController < Ecm::Contact::Configuration.base_controller.constantize
  def index
    @title = I18n.t('ecm.contact.request.index.title')
    @contact_request = Ecm::Contact::Request.new
  end

  def create
    @title = I18n.t('ecm.contact.request.index.title')
    @contact_request = Ecm::Contact::Request.new(params[:ecm_contact_request])

    if @contact_request.deliver
      redirect_to({ action: 'index' }, notice: -> { I18n.t('ecm.contact.form.messages.delivered') }.call)
    else
      render :index
    end
  end
end
