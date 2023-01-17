class Api::V1::LearningResourcesController < ApplicationController
  def index
    learning_resource = LearningResourceFacade.create_learning_resource(params[:country])
    render json: LearningResourceSerializer.new(learning_resource)
  end
end
