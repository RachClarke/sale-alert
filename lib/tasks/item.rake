namespace :item do
  desc "Find out and update price of saved items"
  task get_price: :environment do
    CheckItemPricesJob.perform_later
  end
end
