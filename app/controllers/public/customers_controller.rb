class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customers = current_customer
  end

  def unsubscribe
  end

  def withdrawal
    @customers = current_customer
    if @customers.update(is_active: false)
      reset_session
      redirect_to public_homes_top_path
    else
      render :unsubscribe
    end
  end

  def update
    @customers = current_customer
    if @customers.update(customer_params)
      redirect_to public_customers_my_page_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end
end
