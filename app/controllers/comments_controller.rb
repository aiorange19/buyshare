class CommentsController < ApplicationController
    def create
        @comment = @current_user.comments.new(comment_params)
        
        if @comment.save
            redirect_to item_path(params[:item_id])
        else
            @item = Item.find_by(id: params[:item_id])
            @user = @item.user
            @comments = @item.comments
            
            render 'items/show'
        end
    end
        
    def destroy
        @comment = Comment.find(params[:id]).destroy
        redirect_to item_path(params[:item_id])
    end

    private
        def comment_params
            params.require(:comment).permit(:content).merge(item_id: params[:item_id])
        end
end
