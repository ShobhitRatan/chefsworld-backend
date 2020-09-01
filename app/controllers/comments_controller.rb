class CommentsController < ApplicationController
    def index 
        comments = Comment.all 
        render json: comments 
    end 

    def show 
        comment = Comment.find(params[:id])
        render json: comment 
    end 

    def create 
        comment = Comment.create(comment_params) 
        render json: comment  
    end 

    def update 
        comment = Comment.find(params[:id]) 
        comment.update(comment_params) 
        render json: comment 
    end 

    def destroy 
        comment = Comment.find(params[:id]) 
        unless comment.nil?
            comment.destroy 
            render json: comment 
        else  
            render json: {error: "Comment not found"}, status: 404 
        end 
    end 

    private 

    def comment_params 
        params.permit(:user_id, :recipe_id, :content, :likes) 
    end 
end
