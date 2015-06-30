class Store < ActiveRecord::Base

  def self.unsent_messages
    Message.where("for_send = ? and sent=?",true,false)
  end

  def self.exists_unsent_messages?
    Message.where("for_send = ? and sent=?",true,false).count > 0
  end

  def self.get_unsent_messages_for_client(id_client)
    Message.where("for_send = ? and sent=? and client_id=?",true,false,id_client)
  end


end
