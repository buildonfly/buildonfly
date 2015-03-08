class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :commit_id
      t.string :status
      t.string :reason_for_failure
      t.belongs_to :project, index:true
      t.timestamps null: false
    end
  end
end
