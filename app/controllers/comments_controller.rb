class CommentsController < ApplicationController


  def index
  	@comments = Comment.all
    respond_to do |format|
		  format.json { render json: @comments }
		end
  end

  def create
    respond_with Comment.create!(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :comment)
  end


end
