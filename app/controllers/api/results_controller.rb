class Api::ResultsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :prepare_result, only: [:create, :show]
  respond_to :json

  def index
    render json: Result.all.map(&:to_brief_api)
  end

  def create
    @result = {}
    Result.transaction do
      @result = Result.new(result_params)
      set_subtype
      @result.save!
    end
    render json: @result.to_brief_api
  end

  def show
    render json: @result.to_api
  end

  private
  def result_params
    params.require(:result).permit(:name, :age, :rect, :circle, :triangle, :image, question_ids: [])
  end

  def prepare_result
    @result = Result.find_by_id params[:id] || {}
  end

  def set_subtype
    subtype_value = @result.triangle * 100 + @result.circle * 10 + @result.rect
    subtype = Subtype.where(value: subtype_value).first
    subtype ||= Subtype.first
    @result.subtype = subtype
  end
end