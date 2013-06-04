class Lesson < ActiveRecord::Base
  attr_accessible :description, :lesson_date, :title, :price
  
  
  validates :description,  :presence => true
  validates :lesson_date, :presence => true
  validates :title,  :presence => :true
  
  
    protected
    def validate
  errors.add(:price, "should be positive") unless price.nil? || price > 0.0
  end
  
end
