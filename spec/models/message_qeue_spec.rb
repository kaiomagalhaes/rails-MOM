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
  it 'test qeue' do
    puts Store.unsent_messages.count
    puts Store.exists_unsent_messages?
    MessageQeue.new
  end
end

