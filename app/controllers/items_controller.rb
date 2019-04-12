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
    @item.images.build
  end
    
  def create
    @item = @current_user.items.build(item_params)
    
    @item.images.each_with_index do |image, i|
        if i == 0
            image.main_image = true
        else
            image.main_image = false
        end
    end

    if @item.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/items/index")
    else
      render("items/new")
    end
  end
    
  def edit
    @item = Item.find_by(id: params[:id])
    @images = Image.find_by(id: params[:id])
  end
    
  def update
    @item = Item.find_by(id: params[:id])
      
    if @item.update(content: params[:item][:content], buy_place: params[:item][:buy_place], price: params[:item][:price])
        flash[:notice] = '投稿を編集しました'
        redirect_to(item_path(@item.id))
    else
        render('users/edit.html.erb')
    end  
  end
    
  def destroy
  end
  
   def ensure_correct_user
    @item = Item.find_by(id: params[:id])
    
    if @item.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to(items_path)
    end
  end
    
 private
    
  def item_params
      params.require(:item).permit(:content, :buy_place, :price, images_attributes: {image_name: []})
  end
end
