class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :password_digest, numericality: { greater_than: 6 }

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
