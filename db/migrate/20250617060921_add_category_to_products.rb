class AddCategoryToProducts < ActiveRecord::Migration[8.0]
  def change
    # Remove incorrect columns if they exist
    remove_column :products, :categorys_id if column_exists?(:products, :categorys_id)
    remove_column :products, :categories_id if column_exists?(:products, :categories_id)

    # Ensure category_id exists with correct constraints
    unless column_exists?(:products, :category_id)
      add_reference :products, :category, null: false, foreign_key: true, index: true
    else
      # If category_id exists, ensure it has the correct constraints
      change_column_null :products, :category_id, false
      unless index_exists?(:products, :category_id)
        add_index :products, :category_id
      end
      unless foreign_key_exists?(:products, :categories, column: :category_id)
        add_foreign_key :products, :categories, column: :category_id
      end
    end

    # Assign a default category to existing products to satisfy null: false
    reversible do |dir|
      dir.up do
        default_category = Category.find_or_create_by!(name: 'Default')
        Product.where(category_id: nil).update_all(category_id: default_category.id)
      end
    end
  end
end
