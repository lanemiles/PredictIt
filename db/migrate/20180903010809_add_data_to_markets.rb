class AddDataToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :predictit_id, :integer
    add_column :markets, :name, :text
    add_column :markets, :short_name, :text
    add_column :markets, :ticker_symbol, :text
    add_column :markets, :image, :text
    add_column :markets, :url, :text
    add_column :markets, :status, :string
  end
end
