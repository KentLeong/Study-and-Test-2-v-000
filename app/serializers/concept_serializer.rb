class ConceptSerializer < ActiveModel::Serializer
  attributes :id, :name, :subcategory_id, :description
  has_many :questions, serializer: QuestionSerializer
  has_many :quizzes, serializer: QuizSerializer
end
