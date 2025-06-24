class AddReviewsToProduct < ActiveRecord::Migration[8.0]
  def change
    
    remove_column :reviews, :product_id
   add_reference :reviews, :product, null: false, foreign_key: true, index: true
  end
end
