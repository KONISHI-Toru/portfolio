class CreateTechTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tech_tags do |t|
      t.belongs_to :tech_category, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
