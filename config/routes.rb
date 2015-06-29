Rails.application.routes.draw do
  get 'get_message' => 'message#get_message'
  get 'send_message' => 'message#send_message'
  get 'create_client' => 'client#create'
end
