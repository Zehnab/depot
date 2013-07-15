class Page < ActiveRecord::Base
  attr_accessible :b_address, :b_email, :b_name, :b_tel, :banner_image, :useful_link_1, :useful_link_2, :useful_link_3
  
    mount_uploader :banner_image, ImageUploader
  
end
