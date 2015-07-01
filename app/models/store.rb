class Store < ActiveRecord::Base

  def self.unsent_messages
    Message.where("for_send = ? and sent=? and message_invalid=?",true,false,false)
  end

  def self.exists_unsent_messages?
    Message.where("for_send = ? and sent=? and message_invalid=?",true,false,false).count > 0
  end

  def self.get_unsent_messages_for_client(id_client)
    Message.where("sent=? and client_id=?",false,id_client)
  end

end
