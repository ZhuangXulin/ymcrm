class MedicineController < ApplicationController
  before_filter :authenticate_user!

  #药品信息模块首页
  def index
  	@medicine = Medicine.get_medicine_list(params[:search_key],params[:page])
  end

  #新增药品信息
  def new
  	@medicine = Medicine.new
    @action = :create
  end

  def create
  	@medicine = Medicine.new(medicine_params)
  	respond_to do |format|
        if @medicine.save
          format.html { redirect_to @medicine, notice: 'Medicine was successfully created.' }
          format.json { render :show, status: :created, location: @medicine }
        else
          format.html { render :new }
          format.json { render json: @medicine.errors, status: :unprocessable_entity }
        end
      end
  end

  #显示药品详细信息
  def show
  	@medicine = Medicine.find(params[:id])
  end

  #编辑药品信息
  def edit
  	@medicine = Medicine.find(params[:id])
  	@action = :update
  end

  def update
  	@medicine = Medicine.find(params[:id])
    respond_to do |format|
      if @medicine.update_attributes(medicine_params)
        format.html { redirect_to medicine_url, notice: 'Medicine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  #删除药品信息
  def destroy
  	@medicine = Medicine.find(params[:id])
  	@medicine.destroy
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
