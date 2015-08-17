class TreatmentController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@treatment = Treatment.get_treatment_list(params[:search_key],params[:page])
  end

  #新增疗程信息
  def new
  	@treatment = Treatment.new
  	@action = :create
  end

  def create
  	@treatment = Treatment.new(treatment_params)
  	respond_to do |format|
        if @treatment.save
          format.html { redirect_to @treatment, notice: 'Treatment was successfully created.' }
          format.json { render :show, status: :created, location: @treatment }
        else
          format.html { render :new }
          format.json { render json: @treatment.errors, status: :unprocessable_entity }
        end
      end
  end

  #修改疗程信息
  def edit
    @treatment = Treatment.find(params[:id])
    @action = :update
  end

  def update
    @treatment = Treatment.find(params[:id])
    respond_to do |format|
      if @treatment.update_attributes(treatment_params)
        format.html { redirect_to treatment_url, notice: 'Treatment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  #显示疗程信息详细内容
  def show
    @treatment = Treatment.show(params[:id]).first
  end

  #删除疗程信息
  def destroy
    @treatment = Treatment.find(params[:id])
    @treatment.destroy
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
