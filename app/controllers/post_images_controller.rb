class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save                                               # saveできたら下記を実行する
      redirect_to post_images_path                                    
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order        # indexページでdbから取得するデータ数を全部 → 1ページに決められた数のデータだけを、新しい順に取得するメソッド
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])                         # Viewから送られてきたIDを元にDB内の画像を探し見つける
    @post_image.destroy                                               # DB内で該当するIDの画像を削除する
    redirect_to post_images_path                                      # 上の処理が終わったらoist_images_pathのページを読み込みユーザに見せる
  end

private

  def post_image_params
      params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
