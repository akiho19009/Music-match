class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :music_image
  
end
