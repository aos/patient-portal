class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :update, :destroy]

  # GET /doctors
  def index
    @doctors = Doctor.all

    render json: @doctors
  end

  # GET /doctors/1
  def show
    render json: @doctor
  end

  private
    # Modularized "Find doctor"
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name, :specialty, :education)
    end
end
