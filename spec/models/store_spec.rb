require 'rails_helper'

RSpec.describe Store, :type => :model do

  it 'get all unsent messages' do
    m1= MessageSender.new({"forSend"=> true})
    puts m1.attributes
    puts m1 
  end

end

