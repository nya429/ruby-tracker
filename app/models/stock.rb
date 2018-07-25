class Stock < ActiveRecord::Base
  has_many :user_stocks
  has_many :users, through: :user_stocks
 #class level method self.  no need to instance
  def self.new_from_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    # price = strip_commas(looked_up_stock.latest_price)
      price = looked_up_stock.latest_price
    # in Stock model, no need to Stock.new, instead directly new
      new(name: looked_up_stock.company_name,
          ticker: looked_up_stock.symbol,
          last_price: price)
     rescue Exception => e
       return nil
     end
  end

  def self.strip_commas(number)
    number.gsub(",", "")
  end
end
