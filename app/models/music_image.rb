class MusicImage < ApplicationRecord
  
  #MusicImageモデルからuser_idに関連付けしてUserモデルの参照を可能にする。
  #今回MusicImageモデルに関連付けられるのは１つのUserモデルのみのため、単数形。
  belongs_to :user
  
  #画像アップ用のメソッド、フィールド名にimageを指定
  attachment :image
  
  # has_many :favorites, dependent: destroy
  has_many :music_comments, dependent: :destroy
  
  validates :music_name, presence: true
  validates :image, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
