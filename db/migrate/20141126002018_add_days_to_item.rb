class AddDaysToItem < ActiveRecord::Migration
  def change
    add_column :items, :days, :integer
  end
end
