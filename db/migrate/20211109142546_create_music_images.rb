class CreateMusicImages < ActiveRecord::Migration[5.2]
  def change
    create_table :music_images do |t|
      t.text :music_name
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
