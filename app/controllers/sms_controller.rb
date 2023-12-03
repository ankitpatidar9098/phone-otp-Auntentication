# app/controllers/sms_controller.rb
class SmsController < ApplicationController
  def send_sms
    twi_obj = TwilioTextMessenger.new
    otp = RandomNumberGenerator.new.otp_generator
    mobile = params[:mobile]

    response =  twi_obj.call(mobile,otp)
   puts otp
   puts response

    # Store OTP in the session
    session[:otp] = otp

   render 'home/otppage', locals: { otp: otp }
  end

  def verify_otp
    otp_original = session[:otp]
     # Set a timeout of 5 minutes
     begin
      Timeout.timeout(1 * 60) do
        # Your code here (this will be executed within the timeout period)
        # ...
      end
    rescue Timeout::Error
      # After 5 minutes, this block will be executed
      otp_original = nil
      puts "Number set to nil after 5 minutes"
    end

    if otp_original == params[:otp].to_i
      render 'home/home'
    else
      flash[:notice] = 'Incorrect OTP. Please try again.'
      render 'home/otppage'
    end



  end


end
