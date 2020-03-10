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

private
  def post_image_params
      params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
