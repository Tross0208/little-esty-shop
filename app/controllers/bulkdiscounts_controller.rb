class BulkdiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @bulkdiscount = Bulkdiscount.find(params[:id])
  end

  def destroy
    #binding.pry
    #@merchant = Merchant.find(params[:merchant_id])
    @bulkdiscount = Bulkdiscount.find(params[:id])
    @bulkdiscount.destroy
    redirect_to "/merchants/#{params[:merchant_id]}/bulkdiscounts"
  end


end
