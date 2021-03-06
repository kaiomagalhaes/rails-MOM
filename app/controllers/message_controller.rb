class MessageController < ApplicationController

  def get_messages
    client_id = params.require(:client_id)
    messages = Store.get_unsent_messages_for_client(client_id)
    messages.each  do |message|
      message.sent = true
      message.save!
    end
    render json: {messages:messages}
  end

  def send_message
    begin
      message = Message.new
      subject = Subject.new
      message.for_send = params.require(:for_send)
      message.sent = false
      message.message_invalid = false
      subject.text = params.require(:message)
      client_id = params.require(:client_id)
      message.client = Client.find(client_id)
      message.subject = subject
      subject.save!
      message.save!
      render json: {status: 200,message: message}
    rescue  StandardError => bang
      puts bang
    end
  end

end
