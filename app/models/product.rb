class Product < ApplicationRecord
  has_one_attached :featured_image
  has_many :reviews
  belongs_to :user
end
