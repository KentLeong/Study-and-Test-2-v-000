class UsersController < ApplicationController
  def show
    @user = User.find(current_user)
    @quizzes = @user.quizzes.order(updated_at: :DESC)
    @last_quiz = @user.quizzes.order(updated_at: :DESC).limit(1).first
  end
end
