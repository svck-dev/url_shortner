# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shortner::Enterprise::Urls::ShowContract, type: :contract do
  subject(:contract) { described_class.new }
  describe '#id' do
    context 'when id is invalid' do
      it 'returns a failure' do
        result = contract.call(id: 'invalid')

        expect(result.errors.to_h).to eq(id: [ 'is invalid' ])
      end
    end

    context 'when id is valid' do
      let(:url) { create(:url) }

      it 'returns a success' do
        result = contract.call(id: url.id)

        expect(result).to be_success
      end
    end
  end
end
