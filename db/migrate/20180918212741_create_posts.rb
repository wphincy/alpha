class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :catagory
      t.string :title
      t.text :description
      t.text :comments
      t.string :keyword
      t.integer :numphoto
      t.string :slug

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
