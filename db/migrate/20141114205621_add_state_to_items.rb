class AddStateToItems < ActiveRecord::Migration
  def change
    add_column :items, :state, :boolean, default: false
  end
end
