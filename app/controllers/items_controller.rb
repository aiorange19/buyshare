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
    @item_image = @item.images.build
  end
    
  def create
    @item = set_current_user.items.build(item_params)
      
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
  
 private
    
  def item_params
      params.require(:item).permit(:content, :buy_place, :price, images_attributes: {image_name: []})
  end
end
