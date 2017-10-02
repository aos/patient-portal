class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]

  # GET /appointments -- all appointments for a particular patient
  def index
    @patient = Patient.find(params[:patient_id]) 
    @appointments = @patient.appointments.all

    render json: @appointments
  end

  # GET /appointments/1 -- per appointment
  def show
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:appointment_id])

    render json: @appointment
  end

  # POST /appointments
  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:patient_id, :doctor_id, :start, :end, :symptoms)
    end
end
