class AddCssSelectorToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :css_selector, :string
  end
end
