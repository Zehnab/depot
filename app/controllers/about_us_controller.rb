class AboutUsController < ApplicationController
  def index
          @abouts =About.find :all
          @coaches =Coach.find :all

  end
end
