class PriceSetsController < ApplicationController

  def show
    @price_set = PriceSet.find(params[:id])
  end

end
