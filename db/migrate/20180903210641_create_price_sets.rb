class CreatePriceSets < ActiveRecord::Migration[5.2]
  def change
    create_table :price_sets do |t|

      t.timestamps
    end
  end
end
