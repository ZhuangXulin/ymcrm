class DoctorController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @doctors = Doctor.get_doctor_list(params[:page])
  end
  
  def new
    @doctor = Doctor.new
    if !params[:did].blank?
      puts '---------------'
      @doctor.did = params[:did]
      @doctor.name = params[:name]
      if @doctor.save
        format.html { redirect_to '/doctor#index', notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
  
    end
  end
  
  private
  def doctor_params
    params.require(:doctor).permit(:did, :name)
  end
  
end
