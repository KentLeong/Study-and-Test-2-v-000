class QuizzesController < ApplicationController
  def new
    @concept = Concept.find(params[:concept_id])
    @questions = @concept.questions
    @quiz = Quiz.new
  end
end
