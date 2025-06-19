# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.destroy_all
Article.destroy_all
Vedio.destroy_all


5.times do |i|
  article=Article.create!(content: "content #{i}")
  Post.create!(title: "article #{i}", postable: article)
end
3.times do |i|
  vedio=Vedio.create!(url: "https://www.example.com/vedio#{i+1}")
  Post.create!(title: "vedio #{i}", postable: vedio)
end
