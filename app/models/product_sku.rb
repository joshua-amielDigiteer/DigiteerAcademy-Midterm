class ProductSku < ApplicationRecord
    belongs_to :product
    validates :code, presence: true,  uniqueness: true
    validates :color, presence: true, uniqueness: true
end
