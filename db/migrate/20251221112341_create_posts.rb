class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :source
      t.string :image_url
      t.text :caption
      t.datetime :posted_at
      t.string :instagram_url

      t.timestamps
    end
  end
end
