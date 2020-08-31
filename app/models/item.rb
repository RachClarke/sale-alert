require 'open-uri'
require 'nokogiri'

class Item < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  has_many :previous_prices, dependent: :destroy
  validates :name, :image, :url, :current_price, presence: true
  validates :current_price, numericality: { only_integer: true }

  def get_price(url)
    html_content = URI.parse(url).open.read
    doc = Nokogiri::HTML(html_content)

    unstripped_price = doc.search(self.shop.css_selector).text

    price = strip_price(unstripped_price)

    update_price(price) if price != self.current_price

    price
  end

  private

  def strip_price(price)
    price.gsub(/[£€$]/, '').to_i * 100
  end

  def update_price(new_price)
    old_price = PreviousPrice.new(price: self.current_price, item: self)
    old_price.save!
    self.current_price = new_price
    self.save!
  end
end
