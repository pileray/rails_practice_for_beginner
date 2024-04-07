class SessionsController < ApplicationController
  def new; end

  def create
    user = User.where(email: params[:email_or_name]).or(User.where(name: params[:email_or_name])).take
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to questions_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, success: 'ログアウトしました'
  end
end
