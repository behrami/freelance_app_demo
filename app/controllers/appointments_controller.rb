class AppointmentsController < ApplicationController
  def index
    @appointments_booked = Appointment.where(user_id: current_user.id)
    @appointments_requested = Appointment.where(user_booked_id: current_user.id)

    @users_booked=[]
    @appointments_booked.each do |appointment|
      user = User.find_by(id: appointment.user_booked_id)
      @users_booked.push(user)
    end

    @users_requested=[]
    @appointments_requested.each do |appointment|
      user = User.find_by(id: appointment.user_id)
      @users_requested.push(user)
    end

  end

  def new
    @appointment = Appointment.new

  end

  def create
    @appointment = Appointment.new
    @appointment.user_booked_id = params[:user_id]
    @appointment.user_id = current_user.id
    @appointment.summary = params[:appointments][:summary]
    one=params[:appointments]["time(1i)"].to_i
    two=params[:appointments]["time(2i)"].to_i
    three=params[:appointments]["time(3i)"].to_i
    four=params[:appointments]["time(4i)"].to_i
    five=params[:appointments]["time(5i)"].to_i
    @appointment.time = (DateTime.civil_from_format :local, one, two, three, four, five)

    if @appointment.save
      redirect_to session_appointments_path
    else
      render :new
    end

  end

  def edit

  end

  def update
    appointment_id = params[:id]
    @appointment = Appointment.find_by(id: appointment_id)
    @appointment.summary = params[:appointments][:summary]
    one=params[:appointments]["time(1i)"].to_i
    two=params[:appointments]["time(2i)"].to_i
    three=params[:appointments]["time(3i)"].to_i
    four=params[:appointments]["time(4i)"].to_i
    five=params[:appointments]["time(5i)"].to_i
    @appointment.time = (DateTime.civil_from_format :local, one, two, three, four, five)

    if @appointment.save
      redirect_to session_appointments_path
    else
      render :edit
    end

  end

  def destroy
    appointment_id = params[:id]
    Appointment.find_by(id: appointment_id).delete
    redirect_to session_appointments_path

  end

end
