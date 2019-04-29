class CommentsController < ApplicationController
  def create
    @comment = @current_user.comments.new(comment_params)
    @comment.item_id = params[:item_id]
      
    if @comment.save
      redirect_to(item_path(params[:item_id]))
    else
      flash[:notice] = 'コメントは1文字以上150文字以内で入力してください'
      redirect_to(item_path(params[:item_id]))
    end
  end
    
  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to(item_path(params[:item_id]))
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
