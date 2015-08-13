class NurseController < ApplicationController
  before_filter :authenticate_user!

  #护士模块首页
  def index
    @nurses = Nurse.get_nurse_list(params[:page])
  end

  def new
  	@nurse = Nurse.new
    @action = :create
  end

  #新增护士信息
  def create
  	@nurse = Nurse.new(nurse_params)
  	respond_to do |format|
        if @nurse.save
          format.html { redirect_to @nurse, notice: 'Nurse was successfully created.' }
          format.json { render :show, status: :created, location: @nurse }
        else
          format.html { render :new }
          format.json { render json: @nurse.errors, status: :unprocessable_entity }
        end
      end
  end

  #显示护士详情
  def show
  	@nurse = Nurse.find(params[:id])
  end

  #删除护士详情
  def destroy
  	@nurse = Nurse.find(params[:id])
  	@nurse.destroy
  	respond_to do |format|
      format.html { redirect_to nurse_index_url }
      format.json { head :no_content }
    end
  end

  #更新护士信息
  def edit
  	@nurse = Nurse.find(params[:id])
    @action = :update
  end

  def update
  	@nurse = Nurse.find(params[:id])
    respond_to do |format|
      if @nurse.update_attributes(nurse_params)
        format.html { redirect_to nurse_url, notice: 'Nurse was successfully updated.' }
        format.json { head :no_content }
      else
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
