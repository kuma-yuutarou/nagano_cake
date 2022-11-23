class Address < ApplicationRecord
  belongs_to :customer
  def full_address
    return '〒'+ postal_code+" "+address+" "+name
  end

end
