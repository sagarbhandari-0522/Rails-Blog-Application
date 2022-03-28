class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = 'User logged successfully'
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:danger] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'User log out successfully'
    redirect_to root_path, status: 303
  end
end
