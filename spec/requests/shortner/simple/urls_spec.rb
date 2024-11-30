require 'rails_helper'

RSpec.describe "Shortner::Simple::Urls", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/shortner/simple/urls/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/shortner/simple/urls/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/shortner/simple/urls/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/shortner/simple/urls/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/shortner/simple/urls/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/shortner/simple/urls/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
