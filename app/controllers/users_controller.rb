class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to questions_path, success: 'サインアップが完了しました'
    else
      flash.now[:danger] = 'サインアップに失敗しました'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user && @user.update(user_params)
      redirect_to user_path(@user)
      flash[:success] = "ユーザー情報を更新しました"
    else
      render :edit
      flash.now[:danger] = "ユーザー情報の更新に失敗しました"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio)
  end
end
