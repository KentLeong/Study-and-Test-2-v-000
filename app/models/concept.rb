class Concept < ApplicationRecord
  belongs_to :subcategory
  has_many :questions
  has_many :users, through: :quizzes
  def get_difficulty
    add = 0
    questions.each do |q|
      add += q.difficulty.to_i
    end
    total = add.to_f / self.questions.count.to_f
    total.round(1)
  end

end
