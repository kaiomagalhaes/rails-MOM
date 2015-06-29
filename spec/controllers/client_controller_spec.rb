require 'rails_helper'

RSpec.describe ClientController, type: :controller do

  let(:valid_attributes) {
    {url: "test.com"}
  }
  let(:valid_session) { {} }
  describe "POST #create" do
    context "with valid params" do
      it "creates a new client" do
        get :create, valid_attributes, valid_session
        json_response = JSON.parse(response.body)
        expect(json_response["status"]).to be_eql(200)
      end
    end
  end
end
