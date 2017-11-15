class ArticlesController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find params[:id]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to articles_path
    else
      redirect_to new_article_path(@article.id)
    end
  end


  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update_attributes(article_params)
      redirect_to articles_path
    else
      redirect_to edit_article_path(@article.id)
    end
  end

  def destroy
    @article = Article.find params[:id]

    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :text
    )
  end
end

