class RemoveUnneededColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :markets, :end_date
    remove_column :contracts, :ticket_symbol
  end
end
