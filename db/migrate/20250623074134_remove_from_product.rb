class RemoveFromProduct < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :users_id
    remove_column :products, :users_type
  end
end
