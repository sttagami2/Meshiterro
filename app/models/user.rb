class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :post_images, dependent: :destroy
         has_many :post_comments, dependent: :destroy   # dependent: :destroyは1:Nの関係において、1が削除された場合、関連するNのデータも削除されるもの
         has_many :favorites, dependent: :destroy
end
