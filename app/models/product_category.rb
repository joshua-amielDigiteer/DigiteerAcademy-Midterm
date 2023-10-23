class ProductCategory < ApplicationRecord
    belongs_to :product_type
    has_many :products
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :product_type_id, presence: true
end
