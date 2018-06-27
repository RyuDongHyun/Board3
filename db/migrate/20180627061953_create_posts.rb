class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :img_url
      t.string :tag
      t.string :name

      t.timestamps null: false
    end
  end
end
