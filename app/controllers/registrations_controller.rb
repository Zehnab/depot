class RegistrationsController < ApplicationController
  # GET /registrations
  # GET /registrations.json
   skip_before_filter :verify_authenticity_token, :only => [:notification]
   def notification
    puts 'hello was successfully updated.'
    puts params
    if params[:item_number1] && !params[:item_number1].empty?
    #paypal sends an IPN even when the transaction is voided.
    #save the payment status along with the amount of the transaction.
    if params[:payment_status] != 'Voided'
      @registration= Lesson.find(params[:item_number1].to_i) rescue nil
      @registration.orders.build(:quantity => 1, :amount => params[:mc_gross_1], :status => params[:payment_status]).save unless @registration.nil?
    end
  end
  render :nothing => true
end
  
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.json
  def new
  
    @lesson = Lesson.find(params[:lesson_id])
      @registration=@lesson.registrations.build
   # @registration = Registration.new
  #   @registration = Registration.new({@lesson => params[:lesson_id]}, :without_protection => true)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render json: @registration, status: :created, location: @registration }
      else
        format.html { render action: "new" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to registrations_url }
      format.json { head :no_content }
    end
  end
end
