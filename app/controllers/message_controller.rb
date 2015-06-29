class MessageController < ApplicationController

  def get_message
    render json: {pepapig: "Lol"}
  end

  def send_message
    puts params
    render json: {status: 200}
  end

end
