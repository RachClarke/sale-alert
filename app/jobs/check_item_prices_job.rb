class CheckItemPricesJob < ApplicationJob
  queue_as :default

  def perform
    Item.all.each do |item|
      user = item.user
      recorded_price = item.current_price
      new_price = item.get_price(item.url)
      if recorded_price == new_price
        puts "The price of #{item.name} has not changed."
      else
        puts "The price of #{item.name} has changed. Old price: #{recorded_price} | New price: #{new_price}"
        UserMailer.with(user: user, item: item).price_change.deliver_now
      end
    end
  end
end
