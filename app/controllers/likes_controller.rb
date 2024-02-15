class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_article
  before_action :set_like, only: [:destroy]
  before_action :owner?, only: [:destroy]

  def create
    if already_liked?
    else
      @article.likes.create(user_id: current_user.id)
    end
    redirect_to article_path(@article), notice: "Article liked."
  end

  def destroy
    if !(already_liked?)
    else
      @like.destroy
    end
    redirect_to article_path(@article), notice: "Article unliked."
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_like
    @like = @article.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, article_id:
    params[:article_id]).exists?
  end

  def owner?
    @article = Article.find(params[:article_id])
    @like = @article.likes.find(params[:id])
    unless current_user == @like.user
      fallback_location: root_path
    end
  end

end