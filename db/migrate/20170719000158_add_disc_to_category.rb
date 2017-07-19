class AddDiscToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :disc, :integer, null: false, default: 0
  end
end
