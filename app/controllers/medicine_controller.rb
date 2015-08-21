class MedicineController < ApplicationController
  before_filter :authenticate_user!

  #药品信息模块首页
  def index
  	@medicine = Medicine.get_medicine_list(params[:search_key],params[:page])
    Log.log(current_user.id,request.remote_ip,'medicine_index','search_key:'+params[:search_key].to_s+',page:'+params[:page].to_s)
  end

  #新增药品信息
  def new
  	@medicine = Medicine.new
    @action = :create
    Log.log(current_user.id,request.remote_ip,'medicine_new','')
  end

  def create
  	@medicine = Medicine.new(medicine_params)
  	respond_to do |format|
        if @medicine.save
          Log.log(current_user.id,request.remote_ip,'medicine_create','successfully')
          format.html { redirect_to @medicine, notice: 'Medicine was successfully created.' }
          format.json { render :show, status: :created, location: @medicine }
        else
          Log.log(current_user.id,request.remote_ip,'medicine_create','false')
          format.html { render :new }
          format.json { render json: @medicine.errors, status: :unprocessable_entity }
        end
      end
  end

  #显示药品详细信息
  def show
  	@medicine = Medicine.find(params[:id])
    Log.log(current_user.id,request.remote_ip,'medicine_show','medicine_id:'+params[:id].to_s)
  end

  #编辑药品信息
  def edit
  	@medicine = Medicine.find(params[:id])
  	@action = :update
    Log.log(current_user.id,request.remote_ip,'medicine_edit','medicine_id:'+params[:id].to_s)
  end

  def update
  	@medicine = Medicine.find(params[:id])
    respond_to do |format|
      if @medicine.update_attributes(medicine_params)
        Log.log(current_user.id,request.remote_ip,'medicine_update','medicine_id:'+params[:id].to_s+',successfully')
        format.html { redirect_to medicine_url, notice: 'Medicine was successfully updated.' }
        format.json { head :no_content }
      else
        Log.log(current_user.id,request.remote_ip,'medicine_edit','medicine_id:'+params[:id].to_s+',false')
        format.html { render action: "edit" }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  #删除药品信息
  def destroy
  	@medicine = Medicine.find(params[:id])
  	@medicine.destroy
    Log.log(current_user.id,request.remote_ip,'medicine_destroy','medicine_id:'+params[:id].to_s)
  	respond_to do |format|
      format.html { redirect_to medicine_index_url }
      format.json { head :no_content }
    end
  end

  private
  def medicine_params
    params.require(:medicine).permit(:mid, :name, :description)
  end
end
