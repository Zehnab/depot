class BookingsController < ApplicationController
  
  attr_reader :items
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :set_current_user
  
 
 
  def intialize
    @item=[]
  end
  
  def create   
 
  @lesson=Lesson.find(params[:lesson_id])
  @user=User.current

  user_id = @user.id

  @booking = @lesson.bookings.build({:lesson=>  @lesson, :user=>@user}, :without_protection => true) 
   if@booking.save
   
       @booking.paypal_url(lessons_url)
  
  else
    render :action => 'failure'
  end
 redirect_to lesson_path(@lesson)
end
  
end



