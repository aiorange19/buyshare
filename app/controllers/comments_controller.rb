class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id
    @comment.item_id = params[:item_id]
      
    if @comment.save
      redirect_to("/items/#{params[:item_id]}")
    else
      render template: "items/show"
    end

  end
    
  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to("/items/#{params[:item_id]}")
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
