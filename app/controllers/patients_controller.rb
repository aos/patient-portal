class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :update, :destroy]

  # GET /patients
  def index
    @patients = Patient.all

    render json: @patients
  end

  # GET /patients/1
  def show
    render json: @patient
  end

  private
    # Modularize patient finding
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name, :age)
    end
end