class Order < ApplicationRecord
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting: 0, confirmation: 1, production: 2, preparing: 3, sent: 4 }
end
