class AddColumnToPhases < ActiveRecord::Migration[5.2]
  def change
    add_column :phases, :display_order, :integer, default: 0, null: false, :after => :name
  end
end
