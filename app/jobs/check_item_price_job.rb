class CheckItemPriceJob < ApplicationJob
  queue_as :default

  def perform(item_id)
    item = Item.find(item_id)
    puts "Checking price of #{item.name}"
    sleep 5
    price = item.get_price(item.url)
    puts "Current price: #{price}"
  end
end
