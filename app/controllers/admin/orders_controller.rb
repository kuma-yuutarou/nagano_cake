class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.find(params[:id])
    @order = Order.new
    @customer = Customer.find(params[:id])
  end

  def update
  end
end
