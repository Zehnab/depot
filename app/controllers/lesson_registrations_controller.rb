class LessonRegistrationsController < ApplicationController
  # GET /lesson_registrations
  # GET /lesson_registrations.json
  
  #-------------------authentication 
    before_filter :authenticate_user! , :except =>[:notification]
    
    before_filter :set_current_user
  
   skip_before_filter :verify_authenticity_token, :only => [:notification]

  def index  
     @lesson_bookings =LessonBooking.find :all
      @user=User.current
    if @user=@user.admin
      puts"-------------user authoried-----------------------"
 
  @lesson_registrations = LessonRegistration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lesson_registrations }
    end
        else
      puts"-------------user not authoried-----------------------"
 end
end
  # GET /lesson_registrations/1
  # GET /lesson_registrations/1.json
  def show
       @user=User.current
    if @user=@user.admin
     @lesson_registration =LessonRegistration.find(params[:id])
    
    else

    @lesson_registration = current_user.lesson_registrations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson_registration }
    end
  end
end
  # GET /lesson_registrations/new
  # GET /lesson_registrations/new.json
  def new
      #-------------------get ids
    @lesson = Lesson.find(params[:lesson_id])
    @user=User.current
    @user_id = @user.id
  #-------------------get ids

    @lesson_registration =@lesson.lesson_registrations.build({:user_id =>@user_id}, :without_protection =>true) 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson_registration }
    end
  end

  # GET /lesson_registrations/1/edit
  def edit
          @user=User.current
    if @user=@user.admin
      puts"-------------user authoried-----------------------"

    @lesson_registration = LessonRegistration.find(params[:id])
        else
      puts"-------------user not authoried-----------------------"
    end

  end

  # POST /lesson_registrations
  # POST /lesson_registrations.json
  def create
    @lesson_registration = LessonRegistration.new(params[:lesson_registration])

    respond_to do |format|
      if @lesson_registration.save
        format.html { redirect_to @lesson_registration, notice: 'Lesson registration was successfully created.' }
        format.json { render json: @lesson_registration, status: :created, location: @lesson_registration }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lesson_registrations/1
  # PUT /lesson_registrations/1.json
  def update
    @lesson_registration = LessonRegistration.find(params[:id])

    respond_to do |format|
      if @lesson_registration.update_attributes(params[:lesson_registration])
        format.html { redirect_to @lesson_registration, notice: 'Lesson registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_registrations/1
  # DELETE /lesson_registrations/1.json
  def destroy
    @lesson_registration = LessonRegistration.find(params[:id])
    @lesson_registration.destroy

    respond_to do |format|
      format.html { redirect_to lesson_registrations_url }
      format.json { head :no_content }
    end
  end
  
     def notification
    puts 'hello was successfully updated.'
    puts params
    if params[:item_number1] && !params[:item_number1].empty?
    #paypal sends an IPN even when the transaction is voided.
    #save the payment status along with the amount of the transaction.
    if params[:payment_status] != 'Voided'
      @lesson_registration= LessonRegistration.find(params[:item_number1].to_i) rescue nil
      @lesson_registration.lesson_bookings.build(:quantity => 1, :amount => params[:mc_gross_1], :status => params[:payment_status]).save unless @lesson_registration.nil?
    end
  end
  render :nothing => true
end

end
