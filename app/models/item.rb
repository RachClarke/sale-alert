class Item < ApplicationRecord
  belongs_to :shop
  validates :name, :image, :url, :price, presence: true
  validates :price, numericality: { only_integer: true }
end
