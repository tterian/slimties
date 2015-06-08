class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :image,   null: false, default: ''
      t.text    :content, null: false, default: ''
      t.string  :tags,    null: false, default: ''
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :posts, :user_id
  end
end
