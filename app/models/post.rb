class Post < ApplicationRecord
   delegated_type :postable, types: %w[Article Vedio], dependent: :destroy
   validates :title, presence: true
end
