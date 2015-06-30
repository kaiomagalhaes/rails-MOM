require 'rails_helper'

RSpec.describe MessageController, :type => :controller do
 describe "send message" do
    let(:valid_params_keep_message){
      client = Client.new
      client.url = "test@test.com"
      client.save!
      {client_id: client.id, message: "my message", for_send: true}
    }
    it "send message to a existent user return status 200" do
      get :send_message, valid_params_keep_message
      json_response = JSON.parse(response.body)
      expect(json_response["status"]).to be_eql(200)
      expect(Message.all.count).to be_eql(1)
      expect(Subject.all.count).to be_eql(1)
    end
  end
 describe "get message" do
    let(:client){
      client = Client.new
      client.url = "test@test.com"
      client.save!
      client
    }
    it "get messages" do
      m = Message.new({client: client,sent:false, for_send: true})
      m.save!
      puts client.id
      puts Message.all.first.attributes
      get :get_messages, {client_id: client.id}
      json_response = JSON.parse(response.body)
      expect(json_response["messages"].first["id"]).to be_eql(m.id)
      get :get_messages, {client_id: client.id}
      json_response = JSON.parse(response.body)
      expect(json_response["messages"].count).to be_eql(0)
    end
  end
end

