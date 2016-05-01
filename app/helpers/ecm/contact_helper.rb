module Ecm
  module ContactHelper
    def contact_form(options = {})
      options.reverse_merge(form_target_url: nil)
      form_target_url = options[:form_target_url]

      form_tag_options = {}
      form_tag_options[:url] = form_target_url if form_target_url.present?

      @contact_request = Ecm::Contact::Request.new(params[:ecm_contact_request])

      if params[:ecm_contact_request].present? && @contact_request.deliver
        render 'ecm/contact/requests/form', form_tag_options: form_tag_options, notice: I18n.t('ecm.contact.form.messages.delivered')
      else
        render 'ecm/contact/requests/form', form_tag_options: form_tag_options
      end
    end
  end
end
