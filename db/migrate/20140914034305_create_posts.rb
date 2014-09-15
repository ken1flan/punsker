class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :body_text, null: false
      t.integer :emotion_level, derault: 0, null: false

      t.timestamps
    end
  end
end
