class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :order, presence: true, on: :create
  validates :status, inclusion: { in: %(paid unpaid) }
  validates :total, numericality: { greater_than: 0 }
end

class GoodnessValidator <ActiveModel::Validator
   def custom_validator(record)
     if record.status == "paid"
       puts "you have paid the bill"
     end
   end
end
