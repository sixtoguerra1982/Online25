class CommentsController < ApplicationController
  def index
  	if params[:q].present?
  		@comments = Comment.where('content like ?', "%#{params[:q]}%")
  	else
  		@comments = Comment.all
  	end
  end

  def create
  	@comment = Comment.create(comment_params)
  end

  private def comment_params
  	params.require(:comment).permit(:content)
  end
end
