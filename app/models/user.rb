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

end
