class CreateVehicales < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicales do |t|
      t.string :color
      t.integer :price
      t.string :type

      t.timestamps
    end
  end
end
