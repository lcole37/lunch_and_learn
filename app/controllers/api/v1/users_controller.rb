class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.api_key = SecureRandom.hex(15)
      user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: user.errors.full_messages.to_sentence, status: 422
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
