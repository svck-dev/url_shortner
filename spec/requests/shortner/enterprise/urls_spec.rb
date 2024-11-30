require 'rails_helper'

RSpec.describe "Shortner::Enterprise::Urls", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/shortner/enterprise/urls/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/shortner/enterprise/urls/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/shortner/enterprise/urls/create"
      expect(response).to have_http_status(:success)
    end
  end
end
