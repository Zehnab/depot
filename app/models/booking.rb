class Booking < ActiveRecord::Base
  belongs_to :lesson, :class_name => 'Lesson', :foreign_key => 'lesson_booking'
  belongs_to :user
  attr_accessible :title, :body
  
  accepts_nested_attributes_for :lesson

  def paypal_url(return_url)
    values = {
      :business => "merchant_account@dundee.com",
      :cmd => "_cart",
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    

      values.merge!({
        "amount_1"=>2,
        "item_name_1" => lesson_id,
        "item_number_1"=>id,  
        "quatity_1" =>'1'
     
      })
    
        "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end

