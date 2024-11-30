require 'rails_helper'

RSpec.describe "Shortner::Simple::Urls", type: :request do
  describe "GET /shortner/simple/urls/new" do
    it "returns http success" do
      get new_shortner_simple_url_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /shortner/simple/urls/:id" do
    it "returns http success" do
      url = create(:url)
      get shortner_simple_url_path(url)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /shortner/simple/urls" do
    context 'with valid params' do
      it 'redirects to the show page' do
        post shortner_simple_urls_path, params: { url: attributes_for(:url) }
        expect(response).to redirect_to(shortner_simple_url_path(Url.last))
      end

      it 'creates a new url' do
        expect do
          post shortner_simple_urls_path, params: { url: attributes_for(:url) }
        end.to change(Url, :count).by(1)
      end

      it 'sets the source to simple' do
        post shortner_simple_urls_path, params: { url: attributes_for(:url) }
        expect(Url.last.source).to eq('simple')
      end

      it 'sets the slug to a random alphanumeric string' do
        post shortner_simple_urls_path, params: { url: { original: Faker::Internet.url } }
        expect(Url.last.slug).to match(/\A[a-zA-Z0-9]{6}\z/)
      end

      it 'sets the original to the provided url' do
        post shortner_simple_urls_path, params: { url: { original: Faker::Internet.url } }
        expect(Url.last.original).to eq(Url.last.original)
      end

      it 'sets the slug to the provided slug' do
        slug = Faker::Alphanumeric.alpha(number: 6)
        post shortner_simple_urls_path, params: { url: { original: Faker::Internet.url, slug: slug } }
        expect(Url.last.slug).to eq(slug)
      end
    end

    context 'with invalid params' do
      it 'renders the new page' do
        post shortner_simple_urls_path, params: { url: { original: 'invalid' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('Original is invalid')
      end

      it 'does not create a new url' do
        expect do
          post shortner_simple_urls_path, params: { url: { original: 'invalid' } }
        end.not_to change(Url, :count)
      end

      it 'renders the new page with the invalid url' do
        post shortner_simple_urls_path, params: { url: { original: 'invalid' } }
        expect(response.body).to include('invalid')
      end
    end
  end
end
