class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :inquest, :answer, :concept_id, :user_id, :difficulty, :wrong_answers
end
