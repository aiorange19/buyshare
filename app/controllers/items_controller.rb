class ItemsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
    
  def index
    @items = Item.all.order(created_at: :desc)
  end
   
  def show
    @item = Item.find_by(id: params[:id])
    @user = @item.user
      
    @likes_count = Like.where(item_id: @item.id).count
    @wants_count = Want.where(item_id: @item.id).count
      
    @comments = @item.comments
    @comment = Comment.new
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
    @item = Item.find(params[:id])  
  
    if @item.update(item_update_params)
        flash[:notice] = '投稿を編集しました'
        redirect_to(item_path(@item.id))
    else
        render('items/edit')
    end  
  end
    
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      
    @item.images.each do |i|
      i.destroy
    end
    
    flash[:notice] = '投稿を削除しました'
    redirect_to("/items/index")
      
  end
    
　def ensure_correct_user
     @item = Item.find_by(id: params[:id])
     
     unless @current_user.has_item?(@item)
      flash[:notice] = "権限がありません"
      redirect_to(items_path)
     end
 end
    
 private
    
  def item_params
      params.require(:item).permit(:content, :buy_place, :price, images_attributes: [:id, {image_name: []}, :main_image])
  end
    
   def item_update_params
      params.require(:item).permit(:content, :buy_place, :price, images_attributes: [:id, :image_name, {image_name: []}])
  end
  
end

