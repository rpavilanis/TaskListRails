class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :name
      t.string :email
      t.string :avatar
      t.integer :follower_count

      t.timestamps null: false
    end
  end
end
