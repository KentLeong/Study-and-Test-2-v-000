class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :concepts
  has_many :users, through: :tests
end
