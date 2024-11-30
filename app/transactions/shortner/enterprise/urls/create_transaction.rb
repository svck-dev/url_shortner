# frozen_string_literal: true

class Shortner::Enterprise::Urls::CreateTransaction < ActiveTransaction::ApplicationTransaction
  step :validate
  step :commit

  private

  def validate(input)
    contract = Shortner::Enterprise::Urls::CreateContract.new
    result = contract.call(input.to_h)
    return Failure(result.errors.to_h) if result.failure?

    Success(result.to_h)
  end

  def commit(input)
    url = Url.new(input.merge(source: "enterprise"))
    return Failure(url.errors) unless url.save

    Success(url)
  end
end
