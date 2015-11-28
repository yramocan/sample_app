class CreateFavoriteMicroposts < ActiveRecord::Migration
  def change
    create_table :favorite_microposts do |t|
      t.integer :micropost_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
