class Ecm::Contact::RequestsController < Ecm::Contact::Configuration.base_controller.constantize
  def index
    @title = I18n.t('ecm.contact.request.index.title')
    @contact_request = Ecm::Contact::Request.new
  end

  def create
    @title = I18n.t('ecm.contact.request.index.title')
    @contact_request = Ecm::Contact::Request.new(params[:ecm_contact_request])

    if @contact_request.deliver
      redirect_to(after_create_url, notice: -> { I18n.t('ecm.contact.form.messages.delivered') }.call)
    else
      render :index
    end
  end

  private

  def after_create_url
    Ecm::Contact::Configuration.after_create_url.call(self)
  end
end
