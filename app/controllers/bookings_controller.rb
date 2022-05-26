require 'date'

class BookingsController < ApplicationController
  before_action :set_experience, only: [:new, :create, :show]
  before_action :set_booking, only: [:show]

  # def index
  #   @booking = booking.where(user: current_user)
  # end

  def index
    # @user = User.find(session[:user_id])
    @bookings = Booking.where(user_id: current_user.id)
  end

  # def index
  #   raise
  #   @user = User.find(session[:id])
  #   @booking = @user.booking
  # end


  def new
    @booking = Booking.new
  end

  def create
    temp = bookings_params
    date_params = {}
    date_params[:start_date] = Date.new(temp["start_date(1i)"].to_i, temp["start_date(2i)"].to_i, temp["start_date(3i)"].to_i)
    date_params[:end_date] = Date.new(temp["end_date(1i)"].to_i, temp["end_date(2i)"].to_i, temp["end_date(3i)"].to_i)
    @booking = Booking.new(date_params)
    @booking.experience = @experience
    @booking.user = current_user
    @booking.save
    redirect_to experience_booking_path(@experience, @booking)
  end

  def show
    # @user = User.find(session[:user_id])
    # raise
    # @booking = Booking.where(user_id: current_user)
    # @booking = booking.where(user: current_user)
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_experience
   @experience = Experience.find(params[:experience_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def my_booking

  end


end
