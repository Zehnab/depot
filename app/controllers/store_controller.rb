class StoreController < ApplicationController
  def index
    @products =Product.find_products_for_sale
    @cart =find_cart
   # @coaches =Coach.find :all
  end
  

  
  def add_to_cart
     product = Product.find(params[:id])
        @cart = find_cart
        @cart.add_product(product)
         redirect_to :action =>'index'
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid product #{params[:id]}")
          flash[:notice]="invalid product"
        redirect_to :action =>'index'
  end
  
    def empty_cart
   session[:cart]=nil
  flash[:notice]="your cart is empty"
    redirect_to :action => 'index'
   
  end
  private
  def find_cart
    session[:cart]||= Cart.new
  end
  
end
