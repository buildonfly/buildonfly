class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :address
      t.integer :is_primary, :default => 0
      t.belongs_to :project, index:true
      t.timestamps null: false
    end
  end
end
