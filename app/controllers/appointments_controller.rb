class AppointmentsController < ApplicationController
  # Used before all /appointments/
  before_action :set_patient

  # GET /api/:patient_id/appointments
  def index
    # :include allows nested associations
    @appointments = @patient.appointments.to_json(:include => {:patient => {:only => :name}, :doctor => {}})

    render json: @appointments
  end

  # GET /api/:patient_id/appointments/:id
  def show
    @appointment = @patient.appointments.find(params[:id]).to_json(:include => {:patient => {:only => :name}, :doctor => {}})

    render json: @appointment
  end

  # POST /appointments
  # def create
    # @appointment = @patient.appointments.new(appointment_params)

    # if @appointment.save
      # render json: @appointment, status: :created, location: @appointment
    # else
      # render json: @appointment.errors, status: :unprocessable_entity
    # end
  # end

  private
    # Find patient
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def appointment_params
      params.require(:appointment).permit(:patient_id, :doctor_id, :start, :end, :symptoms)
    end
end
