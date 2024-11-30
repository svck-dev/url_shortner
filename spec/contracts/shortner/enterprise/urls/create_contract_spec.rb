# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shortner::Enterprise::Urls::CreateContract, type: :contract do
  subject(:contract) { described_class.new }

  describe '#slug' do
    context 'when slug is alphanumeric' do
      it 'returns a success' do
        result = contract.call(slug: 'slug', original: 'https://example.com')

        expect(result).to be_success
      end
    end

    context 'when slug is not alphanumeric' do
      it 'returns a failure' do
        result = contract.call(slug: 'slug!', original: 'https://example.com')

        expect(result.errors.to_h).to eq(slug: ['must be alphanumeric'])
      end
    end

    context 'when slug is already taken' do
      let(:url) { create(:url) }

      it 'returns a failure' do
        result = contract.call(slug: url.slug, original: 'https://example.com')

        expect(result.errors.to_h).to eq(slug: ['has already been taken'])
      end
    end
  end

  describe '#original' do
    context 'when original is a valid URL' do
      it 'returns a success' do
        result = contract.call(slug: 'slug', original: 'https://example.com')

        expect(result).to be_success
      end
    end

    context 'when original is not a valid URL' do
      it 'returns a failure' do
        result = contract.call(slug: 'slug', original: 'example.com')

        expect(result.errors.to_h).to eq(original: ['is not a valid URL'])
      end
    end
  end
end
