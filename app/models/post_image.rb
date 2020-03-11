class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy      # post_imageモデルとpost_commentsモデルを関連づける
  has_many :favorites, dependent: :destroy          # post_imageモデルとfavoritesモデルを関連づける
  
  # バリデーション
  validates :shop_name, presence: true
  validates :image, presence: true
  # バリデーション

  # favorited_by?メソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    # 「含まれる時 / 含まれない時」で表示と機能を分けるメソッド
  end
  # favorited_by?
  
end
