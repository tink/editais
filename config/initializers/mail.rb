ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "tink.com.br",
  :user_name            => "testes@tink.com.br",
  :from                 => "testes@tink.com.br",
  :password             => "tink!staff",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
