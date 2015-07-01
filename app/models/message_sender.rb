require 'net/http'
require "uri"
class MessageSender

  def initialize message
    puts "sending message..."
    send message
  end

  def send message
    begin
      url = message.client.url
      url << "?#{message.subject.text}"
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      body = JSON.parse(response.body)
      response_status = body["status"]
      is_valid = response_status == 200
      if is_valid then
        message.sent = true
        message.save
      elsif response_status == 400 then
        message.message_invalid = true
        message.save
        puts "Client url is invalid! message will not be send!"
      elsif
        puts "Message not send, we will try again in a few seconds"
      end
    rescue StandardError => bang
      puts bang
    end
  end
end
