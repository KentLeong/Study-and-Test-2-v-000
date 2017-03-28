class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :concept

  serialize :question_ids, Array
  serialize :user_answers, Array

  validate :empty_fields


  def empty_fields
    errors.add(:user_answers, "must fill out all questions") unless self.question_ids.count == self.user_answers.count
  end

  def correct
    correct = []
    self.question_ids.each_with_index do |question_id, index|
      question = Question.find(question_id)
      user_answer = self.user_answers[index]
      if question.answer == user_answer
        correct << {"#{question_id}" => user_answer}
      end
    end
    correct
  end

  def incorrect
    incorrect = []
    self.question_ids.each_with_index do |question_id, index|
      question = Question.find(question_id)
      user_answer = self.user_answers[index]
      if question.answer != user_answer
        incorrect << {"#{question_id}" => user_answer}
      end
    end
    incorrect
  end


  def self.get_grade(percent)
    if percent >= 90
      grade = "A"
    elsif percent >= 80
      grade = "B"
    elsif percent >= 70
      grade = "C"
    elsif percent >= 60
      grade = "D"
    else percent >= 50
      grade = "E"
    end
    grade
  end

  def self.get_percent(questions)
    correct = 0
    questions.each do |q, user_answer|
      inquest = Question.find(q)
      correct += 1 if inquest.answer == user_answer
    end
    return (correct.to_f / questions.count.to_f) * 100
  end

end
