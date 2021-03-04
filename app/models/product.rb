class Product < ApplicationRecord
  validates :name, presence: true

  validates :price, presence: true

  validates :image_url, presence: true

  validates :description, presence: true

  validates :quantity, presence: true

  # validates :price, numericality: {greater_than }

  validates :quantity, numericality: {only_integer: true}

  validates :description, length: {minimum: 20}

  validates :description, length: {maximum: 500}

  validates :name, uniqueness: true

end
  def is_discounted?
    price <= 10
  end

  def tax
   price * 0.09
  end

  def total
    tax + price
  end
end
