class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, confirmation: 1, production: 2, preparing: 3, sent: 4 }
  def amount_all
    sum = 0
    self.order_details.each do |order_detail|
      sum+= order_detail.amount
    end
    return sum
  end
  def full_address
    return '〒'+ postal_code+" "+address+" "+name
  end
end
