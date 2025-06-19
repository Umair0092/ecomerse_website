class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :postable, polymorphic: true,null: false
      t.timestamps
    end
    create_table :articles do |t|
      t.text :content
      t.timestamps
    end
    create_table :vedios do |t|
      t.string :url
      t.timestamps
    end
  end
end
