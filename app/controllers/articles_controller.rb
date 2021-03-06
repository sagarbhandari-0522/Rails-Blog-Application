# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]
  before_action :authenticate_user, except: %i[index show]
  before_action :authenticate_same_user, only: %i[edit update delete]

  def index
    @pagy, @articles = pagy(Article.all, items: 5)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      flash[:success] = 'Articles Created Successfully'
      redirect_to article_path(@article)
    else
      flash[:danger] = 'Articles Created Unsuccessfull'

      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:success] = 'Articles updated Successfully'
      redirect_to article_path(@article)
    else
      flash[:danger] = "Articles isn't Updated"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = 'Articles Deleted Successfully'
    redirect_to articles_path, status: :see_other
  end

  def authenticate_same_user
    if current_user != @article.user && !current_user.admin
      flash[:danger] = 'You dont have access'
      redirect_to login_path, status: 303
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def find_article
    @article = Article.find_by_id(params[:id])
  end
end
