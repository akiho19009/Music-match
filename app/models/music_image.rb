class MusicImage < ApplicationRecord
  
  #MusicImageモデルからuser_idに関連付けしてUserモデルの参照を可能にする。
  #今回MusicImageモデルに関連付けられるのは１つのUserモデルのみのため、単数形。
  belongs_to :user
  
  #画像アップ用のメソッド、フィールド名にimageを指定
  attachment :image
  
end
