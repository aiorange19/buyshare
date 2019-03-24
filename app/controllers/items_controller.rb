class ItemsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
    
  def index
    @items = Item.all.order(created_at: :desc)
  end
    
  def show
    @item = Item.find_by(id: params[:id])
    @user = @item.user
  end
    
  def new
    @item = Item.new
  end
    
  def create
    @item = Item.new(
        content: params[:item][:content],
        buy_place: params[:item][:buy_place],
        price: params[:item][:price],
        user_id: @current_user.id
        )
      
    if @item.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/items/index")
    else
      render("items/new")
    end
  end
    
  def edit
  end
    
  def update
  end
    
  def destroy
  end
    
end
