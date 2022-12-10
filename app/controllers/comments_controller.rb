class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])  
    @comment = @article.comments.create(comment_params)    
    @user_id = current_user.id  
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end