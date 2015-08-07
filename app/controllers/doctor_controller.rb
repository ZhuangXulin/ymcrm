class DoctorController < ApplicationController
  before_filter :authenticate_user!

  #医生模块首页
  def index
    @doctors = Doctor.get_doctor_list(params[:page])
  end
  
  def new
    @doctor = Doctor.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @doctor }
    end
  end

  #新增医生信息
  def create
    @doctor = Doctor.new(doctor_params)
      respond_to do |format|
        if @doctor.save
          format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
          format.json { render :show, status: :created, location: @doctor }
        else
          format.html { render :new }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
  end

  #修改医生信息
  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
      if @doctor.update_attributes(doctor_params)
        format.html { redirect_to doctor_url, notice: 'Doctor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  #删除医生信息
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctor_index_url }
      format.json { head :no_content }
    end
  end

  #获取医生详细信息
  def show
    @doctor = Doctor.find(params[:id])
  end
  
  private
  def doctor_params
    params.require(:doctor).permit(:did, :name, :photo)
  end
  
end
