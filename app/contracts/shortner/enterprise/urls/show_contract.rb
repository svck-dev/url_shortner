# frozen_string_literal: true

class Shortner::Enterprise::Urls::ShowContract < ActiveTransaction::ApplicationContract
  params do
    required(:id).filled(:string)
  end

  rule(:id) do
    key.failure("is invalid") unless Url.exists?(id: value)
  end
end
