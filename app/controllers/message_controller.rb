class MessageController < ApplicationController

  def get_message
    render json: {pepapig: "Lol"}
  end

  def send_message
    message = Message.new
    subject = Subject.new
    message.forSend = params.require(:forSend)
    subject.text = params.require(:message)
    client_id = params.require(:client_id)
    message.client = Client.find(client_id)
    message.subject = subject
    message.save!
    render json: {status: 200,message: message}
  end

end
