class CommentsController < ApplicationController

  #before_action :authenticate_user!
  #before_action :owner?, only: [:destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to article_path(@article), notice: "Comment was successfully created."
    else
      Rails.logger.error(@comment.errors.full_messages.to_sentence)
      redirect_to article_path(@article), alert: "Failed to create comment."
    end

  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other, notice: "Comment was successfully destroyed."
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def owner?
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      unless current_user == @comment.user
        redirect_back fallback_location: root_path, notice: "You must be the author."
      end
    end

end
