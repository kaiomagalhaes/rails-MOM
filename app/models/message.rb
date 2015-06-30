class Message < ActiveRecord::Base
   attr_accessor :forSend
  has_one :subject
  belongs_to :client
end
