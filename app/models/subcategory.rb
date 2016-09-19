class Subcategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :category
  has_many :concepts
end
