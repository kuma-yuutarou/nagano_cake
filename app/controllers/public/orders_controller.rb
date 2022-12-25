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
      @address = current_customer.addresses.find(params[:order][:address_id])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.name = @address.name
    elsif params[:order][:selected_address] == "2"
    end

  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
    	@order_detail = OrderDetail.new
    	@order_detail.item_id = cart_item.item_id
    	@order_detail.order_id = @order.id
    	@order_detail.price = cart_item.amount * (cart_item.item.price * 1.1).floor
    	@order_detail.amount = cart_item.amount
    	@order_detail.making_status = 0
    	@order_detail.save!
    	cart_item.destroy
    end
    redirect_to public_orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :shipping_cost, :total_payment, :order_status)
  end

end
