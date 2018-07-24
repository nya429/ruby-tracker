class StocksController < ApplicationController

  def search
    if params[:stock].present?
        @stock = Stock.new_from_lookup(params[:stock])
        if @stock.nil?
          render 'users/my_portfolio'
        else
          flash[:danger] = "You have entered an invalid search"
          redirect_to my_portfolio_path
        end
    else
      flash[:danger] = "You have entered an empty search"
      redirect_to my_portfolio_path
    end
  end

end
