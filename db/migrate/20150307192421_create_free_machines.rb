class CreateFreeMachines < ActiveRecord::Migration
  def change
    create_table :free_machines do |t|
      t.string :address
    end
  end
end
