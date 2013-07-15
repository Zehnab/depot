class AboutUsController < ApplicationController
  def index
          @abouts =About.find :all
          @coaches =Coach.find :all
          @pages =Page.find :all

  end
end
