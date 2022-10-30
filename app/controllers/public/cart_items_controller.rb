class Public::CartItemsController < ApplicationController
  def index

  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item
      @cart_item.amount+=CartItem.new(cart_item_params).amount
      @cart_item.save
      redirect_to public_cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to public_cart_items_path
    end
  end
  #@cart_item.amount = @cart_item.amount + CartItem.new(cart_item_params)

  def update

  end

  def destroy

  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
