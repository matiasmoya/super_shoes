require 'rails_helper'

RSpec.describe "Stores", type: :request do
  describe "GET /stores" do
    let!(:store) { create(:store) }

    context "with proper credentials" do 
      it "returns app articles" do
        get services_stores_path,
          headers: {
            HTTP_AUTHORIZATION: "Basic " + Base64::encode64("my_user:my_password")
          }

        expect(response).to have_http_status(200)
        expect(json['stores'].size).to eq(1)
        expect(json['stores'][0]['name']).to eq(store.name)
        expect(json['stores'][0]['address']).to eq(store.address)
      end
    end

    context "with incorrect credentials" do
      it "returns 401 unauthenticated error" do
        get services_stores_path,
          headers: {
            HTTP_AUTHORIZATION: "Basic " + Base64::encode64("wrong_user:wrong_password")
          }
        expect(response).to have_http_status(401)
        
        expect(json['success']).to eq(false)
        expect(json['error_code']).to eq(401)
        expect(json['error_msg']).to eq('Not authorized')
      end
    end
  end
end
