class Concept < ApplicationRecord
  belongs_to :subcategory
  belongs_to :category
  has_many :questions
end
