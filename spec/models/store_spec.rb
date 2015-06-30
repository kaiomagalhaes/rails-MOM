require 'rails_helper'

RSpec.describe Store, :type => :model do

  let(:client){
    client = Client.new({url:"test.com"})
    client.save!
    client
  }
  before(:each){
    m1= Message.new({"for_send"=> true,"sent"=> false,"client"=>client})
    m1.save!
    m2= Message.new({"for_send"=> false,"sent"=> false})
    m2.save!
    m3= Message.new({"for_send"=> true,"sent"=> true})
    m3.save!
  }
  it 'get all unsent messages' do
    expect(Store.unsent_messages.count).to be_eql(1)
  end
  it 'get all unsent messages for client' do
    expect(Store.unsent_messages.count).to be_eql(1)
  end
  it 'exists unsent messages' do
    messages = Store.get_unsent_messages_for_client(client.id)
    expect(messages.count).to be_eql(1)
  end


end

