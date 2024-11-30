# frozen_string_literal: true

module Shortner
  module Enterprise
    module Urls
      class ShowContract < ActiveTransaction::ApplicationContract
        params do
          required(:id).filled(:string)
        end

        rule(:id) do
          key.failure("is invalid") unless Url.exists?(id: value)
        end
      end
    end
  end
end
