Ecm::Contact.configure do |config|
  # Configure your contact requiest recipients here.
  #
  # You can specify multiple recipients and multiple environments.
  #
  # Default:
  #
  # config.recipients = {
  #   :development => %w[ info@development.example.com ],
  #   :test        => %w[ info@test.example.com ],
  #   :production  => %w[ info@production.example.com ]
  # }
  #
  config.recipients = {
    development: %w( info@development.example.com ),
    test: %w( info@test.example.com ),
    production: %w( info@production.example.com )
  }

  # Configure your input field css classes here.
  #
  # Default: config.input_name_css_classes = 'form-control'
  #
  config.input_name_css_classes = 'form-control'

  # Configure your input field css classes here.
  #
  # Default: config.input_email_css_classes = 'form-control'
  #
  config.input_email_css_classes = 'form-control'

  # Configure your input field css classes here.
  #
  # Default: config.input_phone_css_classes = 'form-control'
  #
  config.input_phone_css_classes = 'form-control'

  # Configure your input field css classes here.
  #
  # Default: config.input_message_css_classes = 'form-control'
  #
  config.input_message_css_classes = 'form-control'

  # Configure your input field css classes here.
  #
  # Default: config.input_terms_of_service_css_classes = 'form-control'
  #
  config.input_terms_of_service_css_classes = ''

  # set the base controller for the contact form
  #
  # Default: config.base_controller = 'ApplicationController'
  #
  config.base_controller = 'ApplicationController'

  # Add additional information to the contact form. This will be printed
  # between the heading and the form. You should provide a proc, or
  # an object, that reponds to #call. The view ist provided as paramter.
  #
  # Example: config.additional_contact_information = lambda { |view| view.render 'additional_contact_information' }
  #
  # Default: config.additional_contact_information = nil
  #
  config.additional_contact_information = nil
end
