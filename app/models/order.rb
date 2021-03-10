class Order < ApplicationRecord
  belongs_to :product_id
  belong_to :user
end
