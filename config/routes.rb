Rails.application.routes.draw do
  get 'get_messages' => 'message#get_messages'
  get 'send_message' => 'message#send_message'
  get 'create_client' => 'client#create'
end
