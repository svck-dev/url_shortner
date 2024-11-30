# frozen_string_literal: true

class Url < ApplicationRecord
  validates_uniqueness_of :slug
  validates_presence_of :original
  validates :original, format: { with: URI::DEFAULT_PARSER.make_regexp }

  before_create :generate_slug

  private

  def generate_slug
    self.slug = SecureRandom.alphanumeric(6) if slug.blank?
  end
end
