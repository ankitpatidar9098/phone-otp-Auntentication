Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  post '/send_sms', to: 'sms#send_sms', as: 'send_sms'
  post '/verify_otp', to: 'sms#verify_otp', as: 'verify_otp'


end
