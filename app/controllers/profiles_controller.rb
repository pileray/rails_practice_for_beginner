class ProfilesController < UsersController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:success] = "ユーザー情報を更新しました"
    else
      render :edit
      flash.now[:danger] = "ユーザー情報の更新に失敗しました"
    end
  end
end
