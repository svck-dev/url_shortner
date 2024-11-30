# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shortner::Enterprise::Urls', type: :request do
  describe 'GET /shortner/enterprise/urls/new' do
    it 'returns http success' do
      get new_shortner_enterprise_url_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /shortner/enterprise/urls/:id' do
    it 'returns http success' do
      url = create(:url)
      get shortner_enterprise_url_path(url)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /shortner/enterprise/urls' do
    context 'with valid params' do
      it 'redirects to the show page' do
        post shortner_enterprise_urls_path, params: { url: attributes_for(:url) }
        expect(response).to redirect_to(shortner_enterprise_url_path(Url.last))
      end

      it 'creates a new url' do
        expect do
          post shortner_enterprise_urls_path, params: { url: attributes_for(:url) }
        end.to change(Url, :count).by(1)
      end

      it 'sets the source to enterprise' do
        post shortner_enterprise_urls_path, params: { url: attributes_for(:url) }
        expect(Url.last.source).to eq('enterprise')
      end

      it 'sets the slug to a random alphanumeric string' do
        post shortner_enterprise_urls_path, params: { url: { original: Faker::Internet.url } }
        expect(Url.last.slug).to match(/\A[a-zA-Z0-9]{6}\z/)
      end

      it 'sets the original to the provided url' do
        post shortner_enterprise_urls_path, params: { url: { original: Faker::Internet.url } }
        expect(Url.last.original).to eq(Url.last.original)
      end

      it 'sets the slug to the provided slug' do
        slug = Faker::Alphanumeric.alpha(number: 6)
        post shortner_enterprise_urls_path, params: { url: { original: Faker::Internet.url, slug: slug } }
        expect(Url.last.slug).to eq(slug)
      end
    end

    context 'with invalid params' do
      it 'renders the new page' do
        post shortner_enterprise_urls_path, params: { url: { original: 'invalid' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('Original is not a valid URL')
      end

      it 'does not create a new url' do
        expect do
          post shortner_enterprise_urls_path, params: { url: { original: 'invalid' } }
        end.not_to change(Url, :count)
      end

      it 'renders the new page' do
        post shortner_enterprise_urls_path, params: { url: { slug: 'slug!' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('Slug must be alphanumeric')
      end
    end
  end
end
