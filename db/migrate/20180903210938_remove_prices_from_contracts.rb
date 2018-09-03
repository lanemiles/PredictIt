class RemovePricesFromContracts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contracts, :last_trade_price, :float
    remove_column :contracts, :best_buy_yes_cost, :float
    remove_column :contracts, :best_buy_no_cost, :float
    remove_column :contracts, :best_sell_yes_cost, :float
    remove_column :contracts, :best_sell_no_cost, :float
    remove_column :contracts, :last_close_price, :float
  end
end
