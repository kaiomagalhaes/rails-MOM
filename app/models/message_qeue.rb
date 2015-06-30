class MessageQeue

  def initialize
    startQeue
  end

  def startQeue
    puts "Starting qeue..."
    Thread.new do 
      while true do
        puts "Searching for new messages..."
        if Store.exists_unsent_messages? then
          messages = Store.unsent_messages
          messages.each do |message|
            MessageSender.new message
          end
        end
        sleep(3)
      end
    end 
  end
end
