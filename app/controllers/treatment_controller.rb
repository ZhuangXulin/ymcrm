class TreatmentController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@treatment = Treatment.get_treatment_list(params[:search_key],params[:page])
    Log.log(current_user.id,request.remote_ip,'treatment_index','search_key:'+params[:search_key].to_s+',page:'+params[:page].to_s)
  end

  #新增疗程信息
  def new
  	@treatment = Treatment.new
  	@action = :create
    Log.log(current_user.id,request.remote_ip,'treatment_new','')
  end

  def create
  	@treatment = Treatment.new(treatment_params)
  	respond_to do |format|
        if @treatment.save
          Log.log(current_user.id,request.remote_ip,'treatment_create','successfully')
          format.html { redirect_to @treatment, notice: 'Treatment was successfully created.' }
          format.json { render :show, status: :created, location: @treatment }
        else
          Log.log(current_user.id,request.remote_ip,'treatment_create','false')
          format.html { render :new }
          format.json { render json: @treatment.errors, status: :unprocessable_entity }
        end
      end
  end

  #修改疗程信息
  def edit
    @treatment = Treatment.find(params[:id])
    @action = :update
    Log.log(current_user.id,request.remote_ip,'treatment_edit','treatment_id:'+params[:id].to_s)
  end

  def update
    @treatment = Treatment.find(params[:id])
    respond_to do |format|
      if @treatment.update_attributes(treatment_params)
        Log.log(current_user.id,request.remote_ip,'treatment_update','treatment_id:'+params[:id].to_s+',successfully')
        format.html { redirect_to treatment_url, notice: 'Treatment was successfully updated.' }
        format.json { head :no_content }
      else
        Log.log(current_user.id,request.remote_ip,'treatment_edit','treatment_id:'+params[:id].to_s+',false')
        format.html { render action: "edit" }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  #显示疗程信息详细内容
  def show
    @treatment = Treatment.show(params[:id]).first
    Log.log(current_user.id,request.remote_ip,'treatment_show','treatment_id:'+params[:id].to_s)
  end

  #删除疗程信息
  def destroy
    @treatment = Treatment.find(params[:id])
    @treatment.destroy
    Log.log(current_user.id,request.remote_ip,'treatment_destroy','treatment_id:'+params[:id].to_s)
    respond_to do |format|
      format.html { redirect_to treatment_index_url }
      format.json { head :no_content }
    end
  end

	

  private
  def treatment_params
    params.require(:treatment).permit(:cid, :treatment_content, :mid, :medicine_number, 
                                      :gift, :price, :discount, :discounted_price, 
                                      :actual_income, :remark )
  end
end
