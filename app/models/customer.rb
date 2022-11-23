class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #def full_name
    #first_name + last_name
  #end
  has_many :orders
  has_many :cart_items
  has_many :addresses
end
