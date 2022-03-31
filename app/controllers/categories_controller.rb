class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update destroy]
  def index
    @categories = Category.all
  end

  def show
    redirect_to categories_path, status: :unprocessable_entity unless @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'categorys Created Successfully'
      redirect_to category_path(@category)
    else
      flash[:danger] = 'categorys Created Unsuccessfull'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = 'categorys updated Successfully'
      redirect_to category_path(@category)
    else
      flash[:danger] = "categorys isn't Updated"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    flash[:danger] = 'categorys Deleted Successfully'
    redirect_to categories_path, status: :see_other
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find_by_id(params[:id])
  end
end
