class CommentsController < ApplicationController
  def crgate
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
