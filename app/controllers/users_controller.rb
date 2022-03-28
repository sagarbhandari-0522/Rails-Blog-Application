class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  before_action :authenticate_user, except: %i[index show]

  def index
    @pagy, @users = pagy(User.all)
  end

  def new
    @user = User.new
  end

  def show
    @pagy, @user_articles = pagy(@user.articles, items: 2)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to user_path(@user)

    else
      flash.now[:danger] = 'User Created Unsuccessfull'
      render :new, stauts: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "Welcome to the alpha blog: #{@user.username}"
      redirect_to articles_path
    else
      flash.now[:danger] = 'User is not Updated'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
