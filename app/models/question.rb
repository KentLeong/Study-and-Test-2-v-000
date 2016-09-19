class Question < ApplicationRecord

  belongs_to :concept
  belongs_to :user

  enum qtype: { multiple_choice: 0, true_false: 1, word_question: 2 }

end
