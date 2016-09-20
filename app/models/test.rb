class Test < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_many :questions, through: :concepts
end
