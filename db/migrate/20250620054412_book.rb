class Book < ActiveRecord::Migration[8.0]
  def change
     create_join_table :books, :authors do |t|
       t.index [ :book_id, :author_id ]
     end
  end
end
