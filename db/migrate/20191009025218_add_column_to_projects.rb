class AddColumnToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :published, :boolean, default: false, null: false, :after => :user_id
  end
end
