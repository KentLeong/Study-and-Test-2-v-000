class QuizSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :concept_id, :percent, :grade, :question_ids, :user_answers
end
