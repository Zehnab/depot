class Lesson < ActiveRecord::Base
  attr_accessible :description, :lesson_date, :title, :price, :capacity
  
  
  validates :description,  :presence => true
  validates :lesson_date, :presence => true
  validates :title,  :presence => :true
  validates :capacity,  :presence => :true
  
  has_many :bookings,  :dependent => :destroy
  
    
has_many :orders

has_many :registrations
 before_destroy :ensure_not_referenced_by_any_registration

   def self.current
    Thread.current[:lesson]
  end
  def self.current=(lesson)
    Thread.current[:lesson] = lesson
  end

def paypal_url(return_url,  notify_url)
    values = {
      :business => "seller_account@dundee.com",
      :cmd => "_cart",
      :upload => 1,
      :currency_code=> "GBP",
      :return => return_url,
      :invoice => rand(100),
      :notify_url => notify_url,
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
