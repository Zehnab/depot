class Lesson < ActiveRecord::Base
  attr_accessible :description, :lesson_date, :title, :price, :capacity
  
  
  validates :description,  :presence => true
  validates :lesson_date, :presence => true
  validates :title,  :presence => :true
  validates :capacity,  :presence => :true
  
  has_many :bookings,  :dependent => :destroy
  
    
has_many :orders


def paypal_url(return_url,  notify_url)
    values = {
      :business => "merchant_account@dundee.com",
      :cmd => "_cart",
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url
    }
    

     values.merge!({
    "amount_1" => price,
    "item_name_1" => title,
    "item_number_1" => id,
    "quantity_1" => '1'
     
      })
    
        "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

    protected
    def validate
  errors.add(:price, "should be positive") unless price.nil? || price > 0.0
  end
  
end
