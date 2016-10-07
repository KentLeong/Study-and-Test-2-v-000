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
  validate :unique_wrong_answers

  def unique_wrong_answers
    errors.add(:wrong_answers, "Must have unique wrong answers") unless self.wrong_answers.uniq! == nil
  end

  def get_answers
    answers = []
    self.random_questions.sample(2).each do |q|
      answers << q.name
    end

    begin
      inquest = self.concept.questions.where("id != ?", self.id).sample(1).first.answer
    end until !answers.include? inquest

    answers += [inquest, self.answer]
    answers.shuffle!
  end

end
