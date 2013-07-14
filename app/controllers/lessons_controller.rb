class LessonsController < ApplicationController
  # GET /lessons
  # GET /lessons.json
  skip_before_filter :verify_authenticity_token, :only => [:notification]
   def notification
    puts 'hello was successfully updated.'
    puts params
    if params[:item_number1] && !params[:item_number1].empty?
    #paypal sends an IPN even when the transaction is voided.
    #save the payment status along with the amount of the transaction.
    if params[:payment_status] != 'Voided'
      @lesson = Lesson.find(params[:item_number1].to_i) rescue nil
      @lesson.orders.build(:quantity => 1, :amount => params[:mc_gross_1], :status => params[:payment_status]).save unless @lesson.nil?
    end
  end
  render :nothing => true
end

  #load_and_authorize_resource #uses cancan
  
  #flash[:notice] = "Your Transaction is #{params[:st]} for amount of $#{params[:amt]}. Thank You for shopping." if params[:st]
  def index
        @orders=Order.find :all
    @lessons = Lesson.all
  @date = params[:month] ? Date.parse(params[:month]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lesson = Lesson.find(params[:id])
    #@bookings = Booking.where(lesson: @lesson).count
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/new
  # GET /lessons/new.json
  def new
    @lesson = Lesson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
    @lesson = Lesson.find(params[:id])
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(params[:lesson])

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render json: @lesson, status: :created, location: @lesson }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lessons/1
  # PUT /lessons/1.json
  def update
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url }
      format.json { head :no_content }
    end
  end
  
 
end