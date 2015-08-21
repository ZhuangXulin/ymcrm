class DoctorController < ApplicationController
  before_filter :authenticate_user!

  #医生模块首页
  def index
    @doctors = Doctor.get_doctor_list(params[:search_key],params[:page])
    Log.log(current_user.id,request.remote_ip,'doctor_index','search_key:'+params[:search_key].to_s+',page:'+params[:page].to_s)
  end
  
  def new
    @doctor = Doctor.new
    @action = :create
    Log.log(current_user.id,request.remote_ip,'doctor_new','')
  end

  #新增医生信息
  def create
    @doctor = Doctor.new(doctor_params)
      respond_to do |format|
        if @doctor.save
          Log.log(current_user.id,request.remote_ip,'doctor_create','successfully')
          format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
          format.json { render :show, status: :created, location: @doctor }
        else
          Log.log(current_user.id,request.remote_ip,'doctor_create','false')
          format.html { render :new }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
  end

  #修改医生信息
  def edit
    @doctor = Doctor.find(params[:id])
    @action = :update
    Log.log(current_user.id,request.remote_ip,'doctor_edit','doctor_id:'+params[:id].to_s)
  end

  def update
    @doctor = Doctor.find(params[:id])
    respond_to do |format|
      if @doctor.update_attributes(doctor_params)
        Log.log(current_user.id,request.remote_ip,'doctor_update','doctor_id:'+params[:id].to_s+',successfully')
        format.html { redirect_to doctor_url, notice: 'Doctor was successfully updated.' }
        format.json { head :no_content }
      else
        Log.log(current_user.id,request.remote_ip,'doctor_edit','doctor_id:'+params[:id].to_s+',false')
        format.html { render action: "edit" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  #删除医生信息
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    Log.log(current_user.id,request.remote_ip,'doctor_destroy','doctor_id:'+params[:id].to_s)
    respond_to do |format|
      format.html { redirect_to doctor_index_url }
      format.json { head :no_content }
    end
  end

  #获取医生详细信息
  def show
    @doctor = Doctor.find(params[:id])
    Log.log(current_user.id,request.remote_ip,'doctor_show','doctor_id:'+params[:id].to_s)
  end
  
  private
  def doctor_params
    params.require(:doctor).permit(:did, :name, :photo)
  end
  
end
