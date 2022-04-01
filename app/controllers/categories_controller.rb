class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update destroy]
  before_action :require_admin, only: %i[new create edit update destroy]

  def index
    @categories = Category.all
  end

  def show
    @pagy, @category_articles = pagy(@category.articles, items: 2)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category Created Successfully'
      redirect_to category_path(@category)
    else
      flash[:danger] = 'Category Created Unsuccessfull'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category Updated Successfully'
      redirect_to category_path(@category)
    else
      flash[:danger] = "Category isn't Updated"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    flash[:danger] = 'Category Deleted Successfully'
    redirect_to categories_path, status: :see_other
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find_by_id(params[:id])
  end

  def require_admin
    unless logged_in? && current_user.admin
      flash[:danger] = 'Only admin users can perform that action'
      redirect_to articles_path
    end
  end
end
