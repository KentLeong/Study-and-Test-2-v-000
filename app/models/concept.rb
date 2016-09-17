class Concept < ApplicationRecord
  belongs_to :subcategory
  belongs_to :category
end
