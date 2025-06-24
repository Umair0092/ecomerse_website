class AddDetailsToProducts < ActiveRecord::Migration[8.0]
  def change
    reversible do |direction|
    direction.up { create_table :ps, options: "ENGINE=BLACKHOLE" do |t|
  t.string :name, null: false
end
   }
    direction.down { remove_column :products, :price, :decimal, precision: 5, scale: 2
    add_column :products, :price, :decimal
  }
   end
  end
end
