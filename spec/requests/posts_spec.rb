require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "GET/users/:user_id/posts" do
    it "returns http success" do
      get "/users/:user_id/posts"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end

  describe "GET/users/:user_id/posts/:id" do
    it "returns http success" do
      get "/users/:user_id/posts/:id"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end
end