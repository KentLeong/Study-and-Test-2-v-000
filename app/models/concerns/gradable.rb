module Gradable
  def get_percent(num_correct, total_questions)
    ((num_correct.to_f/total_questions.to_f)*100).ceil
  end

  def get_letter_grade(percent)
    case percent
    when 0..59
      return "F"
    when 60..69
      return "D"
    when 70..79
      return "C"
    when 80..89
      return "B"
    when 90..99
      return "A"
    when 100
      return "S"
    else
      return "O_O"
    end
  end
end
