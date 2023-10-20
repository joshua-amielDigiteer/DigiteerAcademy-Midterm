class ProductType < ApplicationRecord
    has_many :products
    has_many :product_categories
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
end
