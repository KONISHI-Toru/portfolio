class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :target
      t.text :overview
      t.text :hw_configuration
      t.text :sw_configuration
      t.string :production_url
      t.date :from
      t.date :to
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
