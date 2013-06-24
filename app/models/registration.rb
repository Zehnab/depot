class Registration < ActiveRecord::Base
  belongs_to :lesson
  attr_accessible  :address, :child_age, :child_name, :first_name, :last_name, :medical_info, :payment_method, :photo_consent, :lesson_id

  accepts_nested_attributes_for :lesson
  attr_accessible :lesson_id
  
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
    "item_number_1" => lesson.id,
    "quantity_1" => '1'
     
      })
    
        "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
     
   
  end
end
