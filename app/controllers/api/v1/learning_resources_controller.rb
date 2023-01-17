class Api::V1::LearningResourcesController < ApplicationController
  def index
    # require "pry"; binding.pry
    learning_resource = LearningResourceFacade.create_learning_resource(params[:country])
    render json: LearningResourceSerializer.new(learning_resource)
  end
end
