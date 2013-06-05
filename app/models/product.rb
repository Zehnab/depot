class Product < ActiveRecord::Base
  attr_accessible :admin, :description, :img_url, :price, :title
  
  
  validates_presence_of :title, :description, :img_url, :price
  validates_numericality_of :price
  validates_uniqueness_of :title
  validates_format_of :img_url,
  :with => %r{^http:.+\.(gif|jpg|png)$}i,
  :message => "must be a URL for a GIF, JPG, or PNG image"
  protected
  def validate
  errors.add(:price, "should be positive") unless price.nil? || price > 0.00
  end
  
  
def self.find_products_for_sale
  find(:all, :order=>"title")
end
  
  
end
