class Message < ActiveRecord::Base
  has_one :subject
  belongs_to :client
end
