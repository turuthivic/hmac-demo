require 'uri'
require 'net/http'
require 'openssl'
@digest = OpenSSL::Digest.new('sha1')

def hmac1()
  print "Enter the sender message: "
  message1 = gets.chomp
  # digest = OpenSSL::Digest.new('sha384')
  key = 'hmac_key'
  @hmac1 = OpenSSL::HMAC.hexdigest(@digest, key, message1)
  puts "the sender mac function is '#{@hmac1}' \n\n"
  print "********\n"
end

hmac1()

def hmac2()
  print "the received message?: "
  message2 = gets.chomp
  puts "\n\n******** \n\n"
  # digest = OpenSSL::Digest.new('sha384')
  key = 'hmac_key'
  @hmac2 = OpenSSL::HMAC.hexdigest(@digest, key, message2)
  puts "the receiver mac function is '#{@hmac2}'"
  if @hmac1 == @hmac2
  	puts "You are safe. The sender has been authenticated"
  else
  	puts "Warning! Warning!. The You have been hacked!!"
  end
end

hmac2()