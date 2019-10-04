class CreateProjectTechTags < ActiveRecord::Migration[5.2]
  def change
    create_table :project_tech_tags do |t|
      t.references :project, foreign_key: true
      t.references :tech_tag, foreign_key: true

      t.timestamps
    end
  end
end
