require 'json'
require 'net/http'

class MarketsController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }

  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
  end

  def create

    puts "CREATING MARKET: #{params[:market_json]['ID'].to_i}"

    market_json = params[:market_json]
    market = Market.find_or_create_by(predictit_id: market_json['ID'].to_i)

    data = Hash.new.tap do |h|
      h['name'] = market_json['Name']
      h['short_name'] = market_json['ShortName']
      h['ticker_symbol'] = market_json['TickerSymbol']
      h['image'] = market_json['Image']
      h['url'] = market_json['URL']
      h['status'] = market_json['Status']
    end

    market.assign_attributes(data)
    market.save

    market_json['Contracts'].each do |contract_json|

      contract = Contract.find_or_create_by(predictit_id: contract_json['ID'].to_i)

      data = Hash.new.tap do |h|
        h['market_id'] = market.id
        h['end_date'] = DateTime.parse(contract_json['DateEnd']) rescue nil
        h['image'] = contract_json['Image']
        h['url'] = contract_json['URL']
        h['name'] = contract_json['Name']
        h['long_name'] = contract_json['LongName']
        h['short_name'] = contract_json['ShortName']
        h['status'] = contract_json['Status']
      end

      contract.assign_attributes(data)
      contract.save

      if contract.status == "Open"

        price_set = PriceSet.new
        data = Hash.new.tap do |h|
          h['contract_id'] = contract.id
          h['last_trade_price'] = contract_json['LastTradePrice'].to_f
          h['best_buy_yes_cost'] = contract_json['BestBuyYesCost'].to_f
          h['best_buy_no_cost'] = contract_json['BestBuyNoCost'].to_f
          h['best_sell_yes_cost'] = contract_json['BestSellYesCost'].to_f
          h['best_sell_no_cost'] = contract_json['BestSellNoCost'].to_f
          h['last_close_price'] = contract_json['LastClosePrice'].to_f
        end

        price_set.assign_attributes(data)
        price_set.save

      end
    end

    head :ok, content_type: "text/html"

  end

  def update
    uri = URI("https://www.predictit.org/api/marketdata/all/")
    res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      req = Net::HTTP::Get.new(uri)
      req['Accept'] = 'application/json'
      JSON.parse(http.request(req).body)
    end

    res['Markets'][1..100].each do |market_json|
      market_url = request.original_url.gsub(/update/, "markets")
      uri = URI(market_url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.path)
      request['Content-Type'] = "application/json"
      request.body = {market_json: market_json}.to_json
      p request.body
      p market_url
      http.request(request)
    end

    head :ok, content_type: "text/html"
  end

end
