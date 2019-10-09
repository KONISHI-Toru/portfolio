class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :published, :boolean, default: false, null: false, :after => :introduction
  end
end
