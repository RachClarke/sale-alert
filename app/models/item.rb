require 'open-uri'
require 'nokogiri'

class Item < ApplicationRecord
  belongs_to :shop
  validates :name, :image, :url, :price, presence: true
  validates :price, numericality: { only_integer: true }

  def get_price(url)
    html_content = URI.parse(url).open.read
    doc = Nokogiri::HTML(html_content)

    unstripped_price = doc.search(self.shop.css_selector).text

    price = strip_price(unstripped_price)

    update_price(price) if price != self.price

    price
  end

  private

  def strip_price(price)
    price.gsub(/[£€$]/, '').to_i * 100
  end

  def update_price(new_price)
    self.price = new_price
    self.save!
  end
end
