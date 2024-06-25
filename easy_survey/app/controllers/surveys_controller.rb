class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :update]

  def index
    surveys = Survey.all
    render json: {data: surveys}
  end

  def create
    survey = Survey.new(survey_params)
    if survey.save
      render json: survey, status: :created
    else
      render json: survey.errors, status: :unprocessable_entity
    end
  end

  def update
    if @survey.update(survey_params)
      render json: @survey, status: :ok
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @survey, include: :components
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:name, :description, components_attributes: [:id, :component_type, :x, :y, :content,:survey_id, :created_at, :updated_at, :_destroy])
  end
end
