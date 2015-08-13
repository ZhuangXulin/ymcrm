class CustomerController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @customers = Customer.get_customer_list(nil,params[:page])
  end
  
  #新增客户信息
  def new
    @customer = Customer.new
    @doctor = Doctor.get_all_doctor
    @nurse = Nurse.get_all_nurse
    @action = :create
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
    occupation = ''
    for f in params[:customer][:occupation]
      if f != '0'
        occupation += f+'|'
      end
    end
    customer_info['occupation'] = occupation

    #到店渠道
    to_store_channel = ''
    for f in params[:customer][:to_store_channel]
      if f != '0'
        to_store_channel += f+'|'
      end
    end
    customer_info['to_store_channel'] = to_store_channel

    #特殊病史
    special_history = ''
    for f in params[:customer][:special_history]
      if f != '0'
        special_history += f+'|'
      end
    end
    customer_info['special_history'] = special_history
    #是否怀孕
    customer_info['pregnant'] = params[:customer][:pregnant]

    #血型
    blood_type = ''
    for f in params[:customer][:blood_type]
      if f != '0'
        blood_type += f+'|'
      end
    end
    customer_info['blood_type'] = blood_type
    #手术史
    customer_info['operation_history'] = customer_params[:operation_history]
    #是否对药物过敏
    customer_info['drug_allergy'] = customer_params[:drug_allergy]
    #当前是否在服药
    customer_info['medicine'] = customer_params[:medicine]
    #美疗类
    beauty_therapy = ''
    for f in params[:customer][:beauty_therapy]
      if f == '其他'
        if params[:customer][:beauty_therapy_text] != ''
          beauty_therapy += params[:customer][:beauty_therapy_text].to_s+'|'
        end
      elsif f != '0'
          beauty_therapy += f+'|'
      end
    end
    customer_info['beauty_therapy'] = beauty_therapy
    #光疗类
    phototherapy = ''
    for f in params[:customer][:phototherapy]
      if f == '其他'
        if params[:customer][:phototherapy_text] != ''
          phototherapy += params[:customer][:phototherapy].to_s+'|'
        end
      elsif f != '0'
          phototherapy += f+'|'
      end
    end
    customer_info['phototherapy'] = phototherapy
    #注射类-玻尿酸
    hyaluronic_acid = ''
    for f in params[:customer][:hyaluronic_acid]
      if f != '0'
        if params[:customer][:hyaluronic_acid_text] != ''
          hyaluronic_acid params[:customer][:hyaluronic_acid_text]
        end
      end
    end
    customer_info['hyaluronic_acid'] = hyaluronic_acid
    #注射类-微晶瓷
    microcrystalline_porcelain = ''
    for f in params[:customer][:microcrystalline_porcelain]
      if f != '0'
        if params[:customer][:microcrystalline_porcelain_text] != ''
          microcrystalline_porcelain params[:customer][:microcrystalline_porcelain_text]
        end
      end
    end
    customer_info['microcrystalline_porcelain'] = microcrystalline_porcelain
    #注射类-其他
    other_parts = ''
    for f in params[:customer][:other_parts]
      if f != '0'
        if params[:customer][:other_parts_text] != ''
          other_parts params[:customer][:other_parts_text]
        end
      end
    end
    customer_info['other_parts'] = other_parts
    #整形手术
    plastic_part = ''
    for f in params[:customer][:plastic_part]
      if f != '0'
        if params[:customer][:plastic_part_text] != ''
          plastic_part params[:customer][:plastic_part_text]
        end
      end
    end
    customer_info['plastic_part'] = plastic_part
    #治疗需求-肤质
    skin = ''
    for f in params[:customer][:skin]
      if f == '其他'
        if params[:customer][:skin_text] != ''
          skin += params[:customer][:skin_text].to_s+'|'
        end
      elsif f != '0'
          skin += f+'|'
      end
    end
    customer_info['skin'] = skin
    #治疗需求-皱纹
    wrinkle = ''
    for f in params[:customer][:wrinkle]
      if f == '其他'
        if params[:customer][:wrinkle_text] != ''
          wrinkle += params[:customer][:wrinkle_text].to_s+'|'
        end
      elsif f != '0'
          wrinkle += f+'|'
      end
    end
    customer_info['wrinkle'] = wrinkle
    #治疗需求-血管
    blood_vessel = ''
    for f in params[:customer][:blood_vessel]
      if f == '其他'
        if params[:customer][:blood_vessel_text] != ''
          blood_vessel += params[:customer][:blood_vessel_text].to_s+'|'
        end
      elsif f != '0'
          blood_vessel += f+'|'
      end
    end
    customer_info['blood_vessel'] = blood_vessel
    #治疗需求-毛孔
    pore = ''
    for f in params[:customer][:pore]
      if f == '其他'
        if params[:customer][:pore_text] != ''
          pore += params[:customer][:pore_text].to_s+'|'
        end
      elsif f != '0'
          pore += f+'|'
      end
    end
    customer_info['pore'] = pore
    #治疗需求-色素
    pigment = ''
    for f in params[:customer][:pigment]
      if f == '其他'
        if params[:customer][:pigment_text] != ''
          pigment += params[:customer][:pigment_text].to_s+'|'
        end
      elsif f != '0'
          pigment += f+'|'
      end
    end
    customer_info['pigment'] = pigment
    #治疗需求-体型
    figure = ''
    for f in params[:customer][:figure]
      if f == '其他'
        if params[:customer][:figure_text] != ''
          figure += params[:customer][:figure_text].to_s+'|'
        end
      elsif f != '0'
          figure += f+'|'
      end
    end
    customer_info['figure'] = figure
    #其他信息
    customer_info['other_info'] = customer_params[:other_info]
    #治疗前照片
    customer_info['old_photo'] = customer_params[:old_photo]
    #治疗后照片
    customer_info['new_photo'] = customer_params[:new_photo]
    
    @customer = Customer.create(customer_info)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end


  #显示客户的详细信息
  def show
    @customer = Customer.show(params[:id])
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customer_index_url }
      format.json { head :no_content }
    end
  end

  #修改客户信息
  def edit
    @customer = Customer.find(params[:id])
    @action = :update
  end

  def update
    @customer = Customer.find(params[:id])
    respond_to do |format|
      if @customer.update_attributes(customer_params)
        format.html { redirect_to customer_url, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
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
                                      :drug_allergy, :medicine,
                                      :blood_type, :beauty_therapy, :phototherapy,
                                      :other_info,
                                      :old_photo, :new_photo, :place_of_origin, :course_content )
  end
end
