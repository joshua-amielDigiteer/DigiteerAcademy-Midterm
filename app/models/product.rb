class Product < ApplicationRecord
    belongs_to :product_type
    belongs_to :product_category
    has_many :product_skus, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :product_category_id, presence: true
    validates :product_type_id, presence: true
    validates :product_skus, presence:true
    accepts_nested_attributes_for :product_skus, allow_destroy: true
end
