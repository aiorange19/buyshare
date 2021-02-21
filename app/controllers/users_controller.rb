class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id]) 
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
    
  def wants
    @user = User.find_by(id: params[:id])
    @wants = Want.where(user_id: @user.id)
  end 
end
