class ClientController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    @client = Client.new
    @client.url = params.require(:url)
    if @client.save
      status = 200
    else
      status = 400
    end
    render json:{status: status, client_id: @client.id}
  end
end

