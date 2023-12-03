class RandomNumberGenerator

  def otp_generator
    random_4_digit_number = rand(1000..9999)
    puts "Generated random number: #{random_4_digit_number}"


    random_4_digit_number
  end
end
