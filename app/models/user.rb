class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :music_images, dependent: :destroy
  has_many :music_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #refile記述
  attachment :profile_image

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end

#※presenseですが、falseにしないと新規登録時に作用してintroductionがnilとなって新規登録できなくなりますので注意してください。新規登録時に自己紹介も入力必要な場合とするならtrueでOKです
validates :introduction, presence: false, length: { maximum: 50 } # 自己紹介の最高文字数は50文字

end
