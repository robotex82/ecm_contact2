Ecm::Contact.configure do |config|
  # Configure your contact requiest recipients here.
  #
  # You can specify multiple recipients and multiple environments.
  config.recipients = {
    :development => %w[ info@development.example.com ],
    :test        => %w[ info@test.example.com ],
    :production  => %w[ info@production.example.com ]
  }

  # Configure your input field css classes here.
  config.input_name_css_classes             = 'span6'
  config.input_email_css_classes            = 'span6'
  config.input_phone_css_classes            = 'span6'
  config.input_message_css_classes          = 'span12'
  config.input_terms_of_service_css_classes = ''
end
