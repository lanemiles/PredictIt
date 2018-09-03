class AddMarketToContract < ActiveRecord::Migration[5.2]
  def change
    add_reference :contracts, :market, foreign_key: true
  end
end
