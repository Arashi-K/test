class ArticlesController < ApplicationController
  PER = 5
  permits :content

  def index(page: nil)
    @q = Article.all.order(id: "DESC").ransack(params[:q])
    @articles = @q.result(distinct: true).page(page).per(PER)
  end

  def new
    @article = Article.new
  end

  def create(article)
    Article.create(article)
    redirect_to root_path
  end

  def edit(id)
    @article = Article.find(id)
  end

  def update(id, article)
    Article.find(id).update(article)
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
