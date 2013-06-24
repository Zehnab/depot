class Order < ActiveRecord::Base
  attr_accessible :amount, :lesson_id, :quantity, :status
  belongs_to :lessons
  has_one :registration
end
