class OrderDetail < ApplicationRecord
   belongs_to :order
   belongs_to :item
   enum making_status: { productionnotallowed: 0, waitingforproduction: 1, underconstruction: 2, productioncompleted: 3 }
end
