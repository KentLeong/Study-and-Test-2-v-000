class Question < ApplicationRecord

  belongs_to :concept
  belongs_to :user
  has_many :random_questions
  serialize :wrong_answers, Array

  validates_presence_of :inquest, :answer
  validates :difficulty, presence: true, numericality: {
                greater_than_or_equal_to: 0,
                less_than_or_equal_to: 10,
                only_integer: true
  }

  validate :unique_wrong_answers, :wrong_answer_not_equal_to_answer

  def unique_wrong_answers
    errors.add(:wrong_answers, "must have unique wrong answers") unless self.wrong_answers.uniq! == nil
  end

  def wrong_answer_not_equal_to_answer
    errors.add(:wrong_answers, "can't equal to answer") unless !self.wrong_answers.include? self.answer
  end

  def get_answers
    if self.wrong_answers.count == 1
      answers = grab_other_answers(2)
    elsif self.wrong_answers.count == 2
      answers = grab_other_answers(1)
    elsif self.wrong_answers.count >= 3
      answers = self.wrong_answers.sample(3) << self.answer
    else
      answers = grab_other_answers(3)
    end
    answers.flatten.shuffle
  end

  private
    def grab_other_answers(num)
      concept_a = []
      self.concept.questions.each do |q|
        concept_a << q.answer
        concept_a << q.wrong_answers
      end
      a = concept_a.flatten.uniq
      a.delete(self.answer) if a.include? self.answer
      a.sample(num) << [self.wrong_answers, self.answer]
    end
end
