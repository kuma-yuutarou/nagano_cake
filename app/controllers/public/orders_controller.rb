class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total = 0
    @order = Order.new(order_params)
    @order.shipping_cost = 800

    if params[:order][:selected_address] == "0"
      @order = Order.new(order_params)
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:selected_address] == "1"
      @address = current_customer.addressess.find(params[:address_id])
      @order.address = @address.address
    elsif params[:order][:selected_address] == "2"
    end

  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to public_orders_complete_path
  end

  def index

  end

  def show

  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :shipping_cost, :total_payment, :order_status)
  end

end
