# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shortner::Enterprise::Urls::CreateTransaction, type: :transaction do
  subject(:transaction) { described_class.new }

  describe '#call' do
    context 'when the contract is not valid' do
      it 'returns a failure' do
        result = transaction.call({})

        expect(result).to be_failure
      end
    end

    context 'when the contract is valid' do
      let(:contract) { Shortner::Enterprise::Urls::CreateContract.new }
      let(:url) { create(:url) }

      before do
        allow(Shortner::Enterprise::Urls::CreateContract).to receive(:new).and_return(contract)
      end

      it 'returns a success' do
        result = transaction.call({ original: url.original })

        expect(result).to be_success
      end
    end
  end
end
