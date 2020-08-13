namespace :item do
  desc "Find out and update price of saved items"
  task get_price: :environment do
    CheckItemPriceJob.perform_later(1)
  end

end
