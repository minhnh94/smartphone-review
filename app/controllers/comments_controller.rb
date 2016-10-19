class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    @review = Review.find(@comment.review_id)
    if @comment.save
      respond_to do |format|
        format.html do
          flash[:success] = "Comment posted."
          redirect_to @review
        end
        format.js { @new_comment = Comment.new }
      end
    else
      respond_to do |format|
        format.html { render @review }
        format.js { render action: "failed_create" }
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @review = @comment.review
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:success] = "Comment deleted."
        redirect_to @review
      end
      format.js
      @new_comment = Comment.new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :review_id, :user_id)
  end
end
