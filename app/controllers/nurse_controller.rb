class NurseController < ApplicationController
  before_filter :authenticate_user!

  #护士模块首页
  def index
    @nurses = Nurse.get_nurse_list(params[:search_key],params[:page])
    Log.log(current_user.id,request.remote_ip,'nurse_index','search_key:'+params[:search_key].to_s+',page:'+params[:page].to_s)
  end

  def new
  	@nurse = Nurse.new
    @action = :create
    Log.log(current_user.id,request.remote_ip,'nurse_new','')
  end

  #新增护士信息
  def create
  	@nurse = Nurse.new(nurse_params)
  	respond_to do |format|
        if @nurse.save
          Log.log(current_user.id,request.remote_ip,'nurse_create','successfully')
          format.html { redirect_to @nurse, notice: 'Nurse was successfully created.' }
          format.json { render :show, status: :created, location: @nurse }
        else
          Log.log(current_user.id,request.remote_ip,'nurse_create','false')
          format.html { render :new }
          format.json { render json: @nurse.errors, status: :unprocessable_entity }
        end
      end
  end

  #显示护士详情
  def show
  	@nurse = Nurse.find(params[:id])
    Log.log(current_user.id,request.remote_ip,'nurse_show','nurse_id:'+params[:id].to_s)
  end

  #删除护士详情
  def destroy
  	@nurse = Nurse.find(params[:id])
  	@nurse.destroy
    Log.log(current_user.id,request.remote_ip,'nurse_destroy','nurse_id:'+params[:id].to_s)
  	respond_to do |format|
      format.html { redirect_to nurse_index_url }
      format.json { head :no_content }
    end
  end

  #更新护士信息
  def edit
  	@nurse = Nurse.find(params[:id])
    @action = :update
    Log.log(current_user.id,request.remote_ip,'nurse_edit','nurse_id:'+params[:id].to_s)
  end

  def update
  	@nurse = Nurse.find(params[:id])
    respond_to do |format|
      if @nurse.update_attributes(nurse_params)
        Log.log(current_user.id,request.remote_ip,'nurse_update','nurse_id:'+params[:id].to_s+',successfully')
        format.html { redirect_to nurse_url, notice: 'Nurse was successfully updated.' }
        format.json { head :no_content }
      else
        Log.log(current_user.id,request.remote_ip,'nurse_edit','nurse_id:'+params[:id].to_s+',false')
        format.html { render action: "edit" }
        format.json { render json: @nurse.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def nurse_params
    params.require(:nurse).permit(:nid, :name, :photo)
  end
end
