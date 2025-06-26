class Product < ApplicationRecord
  has_one_attached :featured_image
  after_initialize :set_defaults
  after_find :log_load
  has_many :reviews, dependent: :destroy
  belongs_to :user
  private
   def set_defaults
    puts "after_initialize"
   end

  def log_load
    puts "after_find"
  end
end
