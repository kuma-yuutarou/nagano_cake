class Public::ShippingAddressController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id=current_customer.id
    @address.save
    redirect_to public_shipping_address_index_path
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to public_shipping_address_index_path
    else
      render public_shipping_address_index_path
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_shipping_address_index_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
