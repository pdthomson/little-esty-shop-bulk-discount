class BulkDiscountsController < ApplicationController

  def index
    @discounts = Merchant.find(params[:merchant_id]).bulk_discounts
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @discount = BulkDiscount.find(params[:discount_id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    merchant.bulk_discounts.create!(bulk_discount_params)
    redirect_to "/merchants/#{merchant.id}/bulk_discounts"
  end

  def delete
    # binding.pry
    merchant = Merchant.find(params[:merchant_id])
    discount = BulkDiscount.find(params[:discount_id])
    discount.destroy
    redirect_to "/merchants/#{merchant.id}/bulk_discounts"
  end

  private
  def bulk_discount_params
    params.permit(:merchant_id, :discount_percentage, :quantity)
  end
end
