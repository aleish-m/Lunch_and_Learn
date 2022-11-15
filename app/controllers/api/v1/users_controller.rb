class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: { error: 400, message: user.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
