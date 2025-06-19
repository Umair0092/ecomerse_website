module Postable
  extend ActiveSupport::Concern
  included do
    has_one :post, as: :postable, touch: true
  end
end
