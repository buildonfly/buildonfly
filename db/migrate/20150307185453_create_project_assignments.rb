class CreateProjectAssignments < ActiveRecord::Migration
  def change
    create_table :project_assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.string :assignment_type
      t.timestamps null: false
    end
  end
end
