class AddDataToPriceSet < ActiveRecord::Migration[5.2]
  def change
    add_column :price_sets, :last_trade_price, :float
    add_column :price_sets, :best_buy_yes_cost, :float
    add_column :price_sets, :best_buy_no_cost, :float
    add_column :price_sets, :best_sell_yes_cost, :float
    add_column :price_sets, :best_sell_no_cost, :float
    add_column :price_sets, :last_close_price, :float
    add_reference :price_sets, :contract, foreign_key: true
  end
end
