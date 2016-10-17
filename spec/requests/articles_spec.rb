require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET services/articles" do
    let(:store) { create(:store) }
    let!(:article_1) { create(:article, store: store) }
    let!(:article_2) { create(:article, store: store) }

    context "with proper credentials" do 
      it "returns app articles" do
        get services_articles_path,
          headers: {
            HTTP_AUTHORIZATION: "Basic " + Base64::encode64("my_user:my_password")
          }

        expect(response).to have_http_status(200)
        expect(json['articles'].size).to eq(2)
        expect(json['articles'][0]['id']).to eq(article_1.id)
        expect(json['articles'][1]['id']).to eq(article_2.id)
      end
    end

    context "with incorrect credentials" do
      it "returns 401 unauthenticated error" do
        get services_articles_path,
          headers: {
            HTTP_AUTHORIZATION: "Basic " + Base64::encode64("wrong_user:wrong_password")
          }
        expect(response).to have_http_status(401)
        expect(response.body).to eq("HTTP Basic: Access denied.\n")
      end
    end

  end
end
