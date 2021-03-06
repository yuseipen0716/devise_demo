class CommentsController < ApplicationController
  before_action :authenticate_admin!, except: [:create]
  def create
    @comment = Comment.new(comment_params)

    if @comment.save!
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :article_id)
  end
end
