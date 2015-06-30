require 'net/http'
require "uri"
class MessageSender

  def initialize message
    puts "sending message..."
    send message
  end

  def send message
    url = message.client.url
    puts "Sending message to: #{url}"
    uri = URI.parse(url)
   response = Net::HTTP.get_response(uri) 
    puts response
  end
end
