class Coach < ActiveRecord::Base
  attr_accessible :bio, :level, :name , :image
  
  validates :bio,  :presence => true
  validates :level, :presence => true
  validates :name,  :presence => :true
  
   mount_uploader :image, ImageUploader
                 
end
