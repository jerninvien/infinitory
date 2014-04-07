class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    if params[:device_id]
      @device = Device.find(params[:device_id])
      @bookings = @device.bookings
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @bookings = @user.bookings.sort_by(&:start_time).reverse
    end
  end

  def show
    @device = @booking.device
  end

  def new
    @device = Device.find(params[:device_id])
    @booking = Booking.new
  end

  def edit
    @user = current_user
  end

  def create
    @device = Device.find(params[:device_id])
    @booking = @device.bookings.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      flash[:error] = 'There was a problem booking this device'
      render action: 'edit'
    end
  end

  def destroy
    @device = @booking.device
    @booking.destroy
    redirect_to device_bookings_url(@device), notice: 'Booking was successfully destroyed.'
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:title, :description, :start_time, :end_time, :device_id, :user_id)
    end
end