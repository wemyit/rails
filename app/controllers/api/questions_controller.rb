class Api::QuestionsController < ApplicationController
  respond_to :json

  def index
    render json: Question.all
  end
end