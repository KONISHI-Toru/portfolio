class AddColumnToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :display_order, :integer, default: 0, null: false, :after => :name
  end
end
