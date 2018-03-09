class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      render :show
    else
      flash[:errors] = "Invalid Params for User Account"
      redirect_to new_session_url
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def destroy
  end

  def index
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
