class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]

  # GET /appointments
  def index
    @patient = Patient.find(params[:patient_id]) 
    @appointments = @patient.appointments.to_json(:include => {:patient => {:only => :name}, :doctor => {}})

    render json: @appointments
  end

  # GET /appointments/1
  def show
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id]).to_json(:include => [:patient, :doctor])

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
