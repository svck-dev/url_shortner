# frozen_string_literal: true

class Shortner::Enterprise::Urls::CreateContract < ActiveTransaction::ApplicationContract
  params do
    optional(:slug).maybe(:string)
    required(:original).filled(:string)
  end
end
