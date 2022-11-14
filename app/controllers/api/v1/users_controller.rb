class Api::V1::UsersController <ApplicationController
  def create
    user = User.new(user_params)
    require "pry"; binding.pry
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email)
  end
end