class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: {error: 'Missing info'}, status: 422
    else
      favorite = user.favorites.create!(favorite_params)
      render json: { success: 'Favorite added successfully' }, status: 201
    end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
