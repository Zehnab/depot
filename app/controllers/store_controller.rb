class StoreController < ApplicationController
  def index
    @products =Product.find_products_for_sale
   # @coaches =Coach.find :all
  end
end
