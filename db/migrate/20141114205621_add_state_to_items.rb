class AddStateToItems < ActiveRecord::Migration
  def change
      add_column :items, :state, :boolean
  end
end
