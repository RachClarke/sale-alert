class RenamePriceToCurrentPrice < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :price, :current_price
  end
end
