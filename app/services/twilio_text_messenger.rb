require 'rubygems'
require 'twilio-ruby'
class TwilioTextMessenger

  def call(mobile,otp)
    account_sid = 'AC441beb0ebc0ff3c06e9ddcfc193c6dbe'
    auth_token = '0f26aeb891fa856b05ca21c057ddb5ee'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @mobile = mobile
    @otp = otp

    message = @client.messages.create(
      body: "Your OTP is #{@otp}",
      from: '+19252489110',
      to:"+91#{@mobile}"
    )

    # Capture the response details
    response = {
      sid: message.sid,
      message:message.body,
      from:message.from,
      to:message.to,
      status: message.status,
      created_at: message.date_created,
      updated_at: message.date_updated,
      # Add more attributes as needed
    }

    response

  end
end
