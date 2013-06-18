class Order < ActiveRecord::Base
  attr_accessible :amount, :product_id, :quantity, :status

belongs_to :product
has_many :payment_notifications
end
