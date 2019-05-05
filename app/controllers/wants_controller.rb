class WantsController < ApplicationController
    
  before_action :authenticate_user
    
  def create

    @want = Want.new(user_id: @current_user.id, item_id: params[:item_id])
    @want.save
    redirect_to("/items/#{params[:item_id]}")

  end
    
  def destroy

    @want = Want.find_by(user_id: @current_user.id, item_id: params[:item_id])
    @want.destroy
    redirect_to("/items/#{params[:item_id]}")

  end
end