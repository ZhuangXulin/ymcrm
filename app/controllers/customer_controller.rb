class CustomerController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @customers = Customer.get_customer_list(nil,nil)
  end
  
  #新增客户信息
  def new
    @customer = Customer.new
    @doctor = Doctor.get_all_doctor
    @nurse = Nurse.get_all_nurse
  end


  def create
    
    puts '------------------'
    puts '客户编号:'+customer_params[:cid]
    puts '客户姓名:'+customer_params[:name]
    puts '身份证号码:'+customer_params[:id_number]
    puts '生日:'+customer_params[:birthday]
    puts '性别:'+customer_params[:gender]
    puts '是否已婚:'+params[:customer][:marriage].to_s
    puts '联系电话:'+customer_params[:phone]
    puts '民族:'+customer_params[:sub_nationality]
    puts '医师ID:'+customer_params[:doctor_id]
    puts '护士ID:'+customer_params[:nurse_id]
    puts '地址:'+customer_params[:address]
    puts '籍贯:'+customer_params[:place_of_origin]
    puts '疗程内容:'+customer_params[:course_content]


    puts '职业'+customer_params[:occupation].to_s
    puts '到店渠道:'+customer_params[:to_store_channel].to_s
    puts '特殊病史:'+customer_params[:special_history].to_s
    puts '是否怀孕:'+customer_params[:pregnant].to_s
    puts '血型:'+customer_params[:blood_type].to_s
    puts '手术史:'+customer_params[:operation_history]
    puts '是否对药物过敏:'+customer_params[:drug_allergy]
    puts '是否使用药物:'+customer_params[:medicine]
    puts '美疗类:'+customer_params[:beauty_therapy].to_s
    puts '美疗类其他内容:'+params[:beauty_therapy_text].to_s
    puts '光疗类:'+customer_params[:phototherapy].to_s
    puts '光疗类其他内容:'+params[:phototherapy_text].to_s
    puts '注射类-玻尿酸:'+customer_params[:hyaluronic_acid].to_s
    puts '注射类-玻尿酸部位:'+params[:hyaluronic_acid_text].to_s
    puts '注射类—微晶瓷:'+customer_params[:microcrystalline_porcelain].to_s
    puts '注射类-微晶瓷部位:'+params[:microcrystalline_porcelain_text].to_s
    puts '其他:'+customer_params[:other_parts].to_s
    puts '其他部位:'+params[:other_parts_text].to_s
    puts '整形手术:'+customer_params[:plastic_part].to_s
    puts '整形手术部位:'+params[:plastic_part_text].to_s
    puts '治疗需求-肤质:'+customer_params[:skin].to_s
    puts '治疗需求-肤质其他:'+params[:skin_text].to_s
    puts '治疗需求-皱纹:'+customer_params[:wrinkle].to_s
    puts '治疗需求-皱纹其他:'+params[:wrinkle_text].to_s
    puts '治疗需求-血管:'+customer_params[:blood_vessel].to_s
    puts '治疗需求-血管其他'+params[:blood_vessel_text].to_s
    puts '治疗需求-毛孔:'+customer_params[:pore].to_s
    puts '治疗需求-毛孔其他:'+params[:pore_text].to_s
    puts '治疗需求-色素:'+customer_params[:pigment].to_s
    puts '治疗需求-色素其他:'+params[:pigment_text].to_s
    puts '治疗需求-体型:'+customer_params[:figure].to_s
    puts '治疗需求-体型其他:'+params[:figure_text].to_s
    puts '其他:'+customer_params[:other_info]
    puts '------------------'

    
    #设置客户信息散列
    customer_info = Hash.new
    error_info = ''
    if customer_params[:cid].blank?
      puts '+++++++++++++++++++++'
      puts '用户编号为空'
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

    customer_info[''] = ''
    customer_info[''] = ''
    customer_info[''] = ''
    customer_info[''] = ''
    customer_info[''] = ''

    
    if !error_info.blank?
      puts '??????????????????????????'
      puts error_info
      return_to = new_customer_path
      #render :new, location: @customer
      #redirect_to :back
    else
      @customer = Customer.new(customer_params)
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
  end


  #显示客户的详细信息
  def show
    @customer = Customer.find(params[:id])
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customer_index_url }
      format.json { head :no_content }
    end
  end

  private
  def customer_params
    params.require(:customer).permit( :cid, :name, :id_number, :birthday, :gender, 
                                      :marriage, :phone, :sub_nationality, :doctor_id, 
                                      :nurse_id, :address, :occupation, :to_store_channel, 
                                      :special_history, :pregnant, :blood_type, :operation_history,
                                      :drug_allergy, :medicine, :beauty_therapy, :phototherapy, 
                                      :blood_type, :beauty_therapy, :phototherapy, :hyaluronic_acid, 
                                      :microcrystalline_porcelain, :other_parts, :plastic_part, 
                                      :skin, :wrinkle, :blood_vessel, :pore, :pigment, :figure, :other_info,
                                      :old_photo, :new_photo, :place_of_origin, :course_content )
  end
end
