class CustomerController < ApplicationController
  before_filter :authenticate_user!
  
  
  def index
    #gem_customer_list(operation_id,search_key,page)
    #operator_id:操作员id
    #search_key:关键词
    #page:当前页面
    @customers = Customer.get_customer_list(nil,params[:search_key],params[:page])
    Log.log(current_user.id,request.remote_ip,'customer_index','search_key:'+params[:search_key].to_s+',page:'+params[:page].to_s)
  end
  
  #新增客户信息
  def new
    @customer = Customer.new
    @doctor = Doctor.get_all_doctor
    @nurse = Nurse.get_all_nurse
    @action = :create
    Log.log(current_user.id,request.remote_ip,'customer_new','')
  end


  def create
    
    #设置客户信息散列
    customer_info = Hash.new
    error_info = ''
    if customer_params[:cid].blank?
      error_info += '用户编号不能够为空<br>'
    end
    customer_info['cid'] = customer_params[:cid]
    if customer_params[:name].blank?
      error_info += '用户姓名不能够为空<br>'
    end
    customer_info['name'] = customer_params[:name]
    customer_info['id_number'] = customer_params[:id_number]
    customer_info['birthday'] = customer_params[:birthday]
    customer_info['gender'] = customer_params[:gender]
    customer_info['marriage'] = params[:customer][:marriage]
    customer_info['phone'] = customer_params[:phone]
    customer_info['sub_nationality'] = customer_params[:sub_nationality]
    customer_info['doctor_id'] = customer_params[:doctor_id]
    customer_info['nurse_id'] = customer_params[:nurse_id]
    customer_info['address'] = customer_params[:address]
    customer_info['place_of_origin'] = customer_params[:place_of_origin]
    customer_info['course_content'] = customer_params[:course_content]

    #职业
    customer_info['occupation'] = customer_params[:occupation]
    #到店渠道
    customer_info['to_store_channel'] = customer_params[:to_store_channel]
    #特殊病史
    customer_info['special_history'] = params[:customer][:special_history]
    #是否怀孕
    customer_info['pregnant'] = params[:customer][:pregnant]
    #血型
    customer_info['blood_type'] = params[:customer][:blood_type]
    #手术史
    customer_info['operation_history'] = customer_params[:operation_history]
    #是否对药物过敏
    customer_info['drug_allergy'] = customer_params[:drug_allergy]
    #当前是否在服药
    customer_info['medicine'] = customer_params[:medicine]
    #美疗类
    customer_info['beauty_therapy'] = customer_params[:beauty_therapy]
    customer_info['beauty_therapy_text'] = customer_params[:beauty_therapy_text]
    #光疗类
    customer_info['phototherapy'] = customer_params[:phototherapy]
    customer_info['phototherapy_text'] = customer_params[:phototherapy_text]
    #注射类-玻尿酸
    customer_info['hyaluronic_acid'] = customer_params[:hyaluronic_acid]
    customer_info['hyaluronic_acid_text'] = customer_params[:hyaluronic_acid_text]
    #注射类-微晶瓷
    customer_info['microcrystalline_porcelain'] = customer_params[:microcrystalline_porcelain]
    customer_info['microcrystalline_porcelain_text'] = customer_params[:microcrystalline_porcelain_text]
    #注射类-其他
    customer_info['other_parts'] = customer_params[:other_parts]
    customer_info['other_parts_text'] = customer_params[:other_parts_text]
    #整形手术
    customer_info['plastic_part'] = customer_params[:plastic_part]
    customer_info['plastic_part_text'] = customer_params[:plastic_part_text]
    #治疗需求-肤质
    customer_info['skin'] = customer_params[:skin]
    customer_info['skin_text'] = customer_params[:skin_text]
    #治疗需求-皱纹
    customer_info['wrinkle'] = customer_params[:wrinkle]
    customer_info['wrinkle_text'] = customer_params[:wrinkle_text]
    #治疗需求-血管
    customer_info['blood_vessel'] = customer_params[:blood_vessel]
    customer_info['blood_vessel_text'] = customer_params[:blood_vessel_text]
    #治疗需求-毛孔
    customer_info['pore'] = customer_params[:pore]
    customer_info['pore_text'] = customer_params[:pore_text]
    #治疗需求-色素
    customer_info['pigment'] = customer_params[:pigment]
    customer_info['pigment_text'] = customer_params[:pigment_text]
    #治疗需求-体型
    customer_info['figure'] = customer_params[:figure]
    customer_info['figure_text'] = customer_params[:figure_text]
    #其他信息
    customer_info['other_info'] = customer_params[:other_info]
    #治疗前照片
    customer_info['old_photo'] = customer_params[:old_photo]
    #治疗后照片
    customer_info['new_photo'] = customer_params[:new_photo]
    #操作者ID
    customer_info['operator_id'] = current_user.id
    @customer = Customer.create(customer_info)
    respond_to do |format|
      if @customer.save
        Log.log(current_user.id,request.remote_ip,'customer_create','successfully')
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        Log.log(current_user.id,request.remote_ip,'customer_create','false')
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end


  #显示客户的详细信息
  def show
    @customer = Customer.show(params[:id])
    Log.log(current_user.id,request.remote_ip,'customer_show','customer_id:'+params[:id].to_s)
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    Log.log(current_user.id,request.remote_ip,'customer_destroy','customer_id:'+params[:id].to_s)
    respond_to do |format|
      format.html { redirect_to customer_index_url }
      format.json { head :no_content }
    end
  end

  #修改客户信息
  def edit
    @customer = Customer.find(params[:id])
    @action = :update
    Log.log(current_user.id,request.remote_ip,'customer_edit','customer_id:'+params[:id].to_s)
  end

  def update
    @customer = Customer.find(params[:id])
    respond_to do |format|
      if @customer.update_attributes(customer_params)
        Log.log(current_user.id,request.remote_ip,'customer_update','customer_id:'+params[:id].to_s+',successfully')
        format.html { redirect_to customer_url, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        Log.log(current_user.id,request.remote_ip,'customer_edit','customer_id:'+params[:id].to_s+',false')
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def customer_params
    params.require(:customer).permit( :cid, :name, :id_number, :birthday, :gender, 
                                      :marriage, :phone, :sub_nationality, :doctor_id, 
                                      :nurse_id, :address, :pregnant, :operation_history,
                                      :drug_allergy, :medicine,{:occupation => []} ,{:to_store_channel => []}, 
                                      {:special_history => []},
                                      {:blood_type => []}, {:beauty_therapy => []}, {:phototherapy => []},
                                      {:hyaluronic_acid => []},{:microcrystalline_porcelain => []},
                                      {:skin => []},{:wrinkle => []},{:blood_vessel => []},{:pore => []},
                                      {:pigment => []},{:figure => []},:beauty_therapy_text,:phototherapy_text,
                                      :hyaluronic_acid_text,:microcrystalline_porcelain_text,:other_parts,
                                      :other_parts_text,:plastic_part,
                                      :plastic_part_text,:skin_text,:wrinkle_text,:blood_vessel_text,:pore_text,
                                      :pigment_text,:figure_text,:other_info,
                                      :old_photo, :new_photo, :place_of_origin, :course_content )
  end
end
