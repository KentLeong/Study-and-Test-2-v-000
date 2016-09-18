class Test < ApplicationRecord
  belongs_to :user
  has_many :questions, through: :subcategory
end
