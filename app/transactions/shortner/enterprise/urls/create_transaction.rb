# frozen_string_literal: true

class Shortner::Enterprise::Urls::CreateTransaction < ActiveTransaction::ApplicationTransaction
  step :validate
  step :commit

  private

  def validate(input)
  end
  def commit(input)
  end
end
