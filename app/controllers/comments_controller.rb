class CommentsController < ApplicationController


  def index
  	@comments = Comment.all
    respond_to do |format|
		  format.json { render json: @comments }
		end
  end

  def create
    respond_to do |format|
      format.html {render text: "Your data was sucessfully loaded. Thanks"}
      format.json { 
                   Comment.create(comment_params)
                   render text: Comment.last.to_json  # !
                  }
    end
  end

private

  def comment_params
    params.require(:comment).permit(:author, :comment)
  end


end
