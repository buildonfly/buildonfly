class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :fullname
      t.string :password_hash
      t.string :password_salt
      t.integer :active, :default => 0
      t.timestamps null: false
    end
  end
end
