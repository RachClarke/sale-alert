class CreatePreviousPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :previous_prices do |t|
      t.integer :price
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
