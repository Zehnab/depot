class LineItem < ActiveRecord::Base
  # attr_accessible :title, :body
    belongs_to :product


  def self.for_product(product)
    item = self.new         
    item.quantity = 1
    item.product = product
    item.uni_price = product.price
    item
  end

end
