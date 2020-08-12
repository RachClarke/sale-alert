class PreviousPrice < ApplicationRecord
  belongs_to :item
  validates :price, numericality: { only_integer: true }
end
