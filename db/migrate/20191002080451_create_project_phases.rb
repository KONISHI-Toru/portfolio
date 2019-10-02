class CreateProjectPhases < ActiveRecord::Migration[5.2]
  def change
    create_table :project_phases do |t|
      t.references :project, foreign_key: true
      t.references :phase, foreign_key: true

      t.timestamps
    end
  end
end
