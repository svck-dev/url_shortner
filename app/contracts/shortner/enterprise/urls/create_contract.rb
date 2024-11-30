# frozen_string_literal: true

class Shortner::Enterprise::Urls::CreateContract < ActiveTransaction::ApplicationContract
  params do
    optional(:slug).maybe(:string)
    required(:original).filled(:string)
  end

  rule(:slug) do
    if value.present?
      key.failure("must be alphanumeric") unless value.match?(/\A[a-zA-Z0-9]+\z/)
      key.failure("has already been taken") if Url.exists?(slug: value)
    end
  end

  rule(:original) do
    key.failure("is not a valid URL") unless value.match?(URI::DEFAULT_PARSER.make_regexp)
  end
end
