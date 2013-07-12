class LessonBooking < ActiveRecord::Base
  belongs_to :lesson_registration
  attr_accessible :amount, :quantity, :status
end
