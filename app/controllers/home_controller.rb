class HomeController < ApplicationController
  def index
      @posts =Post.find :all
      @pages=Page.find :all
  end
end
