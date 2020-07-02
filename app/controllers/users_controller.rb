class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  #   params[:id]でユーザの情報を取得してインスタンス(@user)に保存
  #   →　編集用のViewでform_forを使うために取得＆保存している
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)       # 何をしているか確認要
  end
end
