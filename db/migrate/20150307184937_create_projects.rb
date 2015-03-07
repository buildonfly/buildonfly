class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :git_url
      t.string :commands
      t.timestamps null: false
    end
  end
end
