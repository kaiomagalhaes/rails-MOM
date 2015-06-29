require 'rails_helper'

RSpec.describe MessageController, :type => :controller do
 describe "send message" do
    let(:valid_params_keep_message){
      {client_id: 1, message: "my message", keep: true}
    }
    it "send message to a existent user return status 200" do
      get :send_message, valid_params_keep_message
      json_response = JSON.parse(response.body)
      expect(json_response["status"]).to be_eql(200)
    end
  end

end

