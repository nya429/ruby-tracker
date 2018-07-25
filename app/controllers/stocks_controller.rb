class StocksController < ApplicationController

  def search
    # if params[:stock].present?
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty search"
    else
       @stock = Stock.new_from_lookup(params[:stock])
       flash.now[:danger] = "You have entered an invalid search" unless @stock
    end
    render partial: 'users/result'
  end

end
