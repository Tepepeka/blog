class AdminController < ApplicationController

  def dashboard
    # Logique pour afficher tous les articles et utilisateurs
    @articles = Article.all
    @users = User.all
  end

  private

  def require_admin
    redirect_to root_path unless current_user&.admin?
  end

end