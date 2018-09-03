class AddDataToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :predictit_id, :integer
    add_column :contracts, :end_date, :datetime
    add_column :contracts, :image, :text
    add_column :contracts, :url, :text
    add_column :contracts, :name, :text
    add_column :contracts, :long_name, :text
    add_column :contracts, :short_name, :text
    add_column :contracts, :ticket_symbol, :text
    add_column :contracts, :status, :string
    add_column :contracts, :last_trade_price, :float
    add_column :contracts, :best_buy_yes_cost, :float
    add_column :contracts, :best_buy_no_cost, :float
    add_column :contracts, :best_sell_yes_cost, :float
    add_column :contracts, :best_sell_no_cost, :float
    add_column :contracts, :last_close_price, :float
  end
end
