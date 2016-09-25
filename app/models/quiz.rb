class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :concept

  extend Gradable
end
