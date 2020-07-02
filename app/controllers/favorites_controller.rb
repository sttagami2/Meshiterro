class FavoritesController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])                       # どの画像の情報が渡されたかfind(params[:post_image_id])により調べる ← Viewからデータをもらい、DBに探しに行く
    favorite = current_user.favorites.new(post_image_id: post_image.id)       # いいねされた画像をユーザのIDと画像のデータを紐付けてDBのカラムに保存できる様にする
    favorite.save                                                             # DBに保存する
    redirect_to post_image_path(post_image)                                   # create実行後にどのURLに移動するかを定義
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
end
