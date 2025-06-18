class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end
    create_table :books do |t|
      t.string :name
      t.datetime :published_at
      t.references :books, :author, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
