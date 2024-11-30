# frozen_string_literal: true

class Shortner::Enterprise::Urls::ShowTransaction < ActiveTransaction::ApplicationTransaction
  step :validate
  step :fetch

  private

  def validate(input)
    contract = Shortner::Enterprise::Urls::ShowContract.new
    result = contract.call(input)
    return Failure(result.errors.to_h) if result.failure?
    Success(result.to_h)
  end

  def fetch(input)
    url = Url.find_by(input)
    return Failure("Url not found") if url.nil?
    Success(url)
  end
end
