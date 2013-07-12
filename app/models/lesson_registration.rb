class LessonRegistration < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :lesson_bookings
  attr_accessible :address, :child_age, :child_name, :first_name, :last_name, :medical_info, :other_details, :payment_method, :photo_consent, :user_id

  validates :first_name,  :presence => true
  validates :last_name, :presence => true
  validates :child_name, :presence => true
  validates :child_age, :presence => true
 
  validates :payment_method, :presence => true



  accepts_nested_attributes_for :lesson
  accepts_nested_attributes_for :user
  attr_accessible :lesson_id, :user_id
  
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
    "amount_1" => lesson.price,
    "item_name_1" => lesson.title,
    "item_number_1" => id,
    "quantity_1" => '1'
     
      })
       
        "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
     
   
  end
end

