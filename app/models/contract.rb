class Contract < ApplicationRecord
  belongs_to :market
  has_many :price_set
end
