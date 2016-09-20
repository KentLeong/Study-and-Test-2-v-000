class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :conceptsd
  has_many :users, through: :tests
end
