class Client < ActiveRecord::Base
  has_many :messages
end
