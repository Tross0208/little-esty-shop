class BulkdiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @bulkdiscount = Bulkdiscount.find(params[:id])
  end

  def destroy
    #binding.pry
    #@merchant = Merchant.find(params[:merchant_id])
    @bulkdiscount = Bulkdiscount.find(params[:id])
    @bulkdiscount.destroy
    redirect_to "/merchants/#{params[:merchant_id]}/bulkdiscounts"
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    bulkdiscount = Bulkdiscount.new(bulkdiscount_params)
      if bulkdiscount.save
        redirect_to merchant_bulkdiscounts_path(params[:merchant_id])
      else
        redirect_to new_merchant_bulkdiscount_path(params[:merchant_id])
        flash[:notice] = "Error: all requested areas must be filled!"
      end
  end

  def edit
    @bulkdiscount = Bulkdiscount.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    bulkdiscount = Bulkdiscount.find(params[:id])
    if bulkdiscount.update(bulkdiscount_params)
      redirect_to merchant_bulkdiscount_path(params[:merchant_id], bulkdiscount.id)
      flash[:notice] = "Discount updated successfully"
    else
      redirect_to edit_merchant_bulkdiscounts_path(params[:merchant_id], bulkdiscount.id)
      flash[:alert] = "Error: Discount not updated"
    end
  end
  private

  def bulkdiscount_params
    params.permit(:id, :quantity, :percent_discount, :merchant_id)
  end

end
