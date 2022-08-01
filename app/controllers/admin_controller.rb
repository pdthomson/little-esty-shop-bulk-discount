class AdminController < ApplicationController

  def index
    @merchants = Merchant.all
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def show_2 
    @merchant = Merchant.find(params[:merchant_id])
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
  end

  def update
    merchant = Merchant.find(params[:merchant_id]) 
    if params[:status] == 'enabled'
      merchant.update(status: params[:status])
      redirect_to "/admin/merchants"
    elsif params[:status] == 'disabled'
      merchant.update(status: params[:status])
      redirect_to "/admin/merchants"
    else
      merchant.update(name: params[:name])
      redirect_to "/admin/merchants/#{merchant.id}"
      flash.notice = 'The information has been successfully updated'
    end   
  end
end


