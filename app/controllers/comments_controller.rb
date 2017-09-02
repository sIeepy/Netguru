class CommentsController < ApplicationController
  expose(:comments)
  expose(:comment, attributes: :comment_params)

  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to movie_path(params[:movie_id]), notice: "Comment was succesfully created"
    else
      redirect_to movie_path(params[:movie_id]), alert: "Comment was not created"
    end
  end

  def destroy
    if current_user.id == comment.user_id
      comment.destroy
      redirect_to movie_path(params[:movie_id]), notice: "Comment was destroy"
    else
      redirect_to movie_path(params[:movie_id]), alert: "Comment was not destroy"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :movie_id, :user_id)
  end
end
