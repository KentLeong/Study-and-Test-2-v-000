class Question < ApplicationRecord

  belongs_to :concept
  belongs_to :user

  enum qtype: { multiple_choice: 0, true_false: 1, word_question: 2 }

  #returns 1 correct answer and 3 random answers from
  #the same concept group as an array
  def get_answers
    array = self.concept.questions.where("id != ?", self.id).sample(3)
    answers = []
    array.each do |a|
      answers << a.answer
    end
    answers << self.answer
    answers.shuffle!
  end
end
