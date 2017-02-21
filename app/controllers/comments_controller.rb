class CommentsController < ApplicationController
  def new
    @goals = Goal.all
  end

  def create
    comment = Comment.new(comment_params)
    comment.commentable_type = :Goal
    if comment.save
      redirect_to user_url(comment.commentable.user)
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:commentable_id, :body)
  end
end
