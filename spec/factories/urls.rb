# frozen_string_literal: true

FactoryBot.define do
  factory :url do
    slug { SecureRandom.alphanumeric(6) }
    original { Faker::Internet.url }
  end
end
