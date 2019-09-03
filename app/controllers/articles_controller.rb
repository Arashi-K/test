class ArticlesController < ApplicationController
  PER = 5

  def index
    @q = Article.all.order(id: "DESC").ransack(params[:q])
    @articles = @q.result(distinct: true).page(params[:page]).per(PER)
  end

  def new
    @article = Article.new
  end

  def create(article)
    Article.create(article.permit(:content))
    redirect_to root_path
  end

  def edit(id)
    @article = Article.find(id)
  end

  def update(id, article)
    Article.find(id).update(article.permit(:content))
    redirect_to root_path
  end

  def show(id)
    @article = Article.find(id)
  end

  def destroy(id)
    Article.find(id).destroy
    redirect_to root_path
  end
end
