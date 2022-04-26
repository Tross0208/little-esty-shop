class BulkdiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @bulkdiscount = Bulkdiscount.find(params[:id])
  end


end
