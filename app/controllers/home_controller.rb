class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  	@customer_count = Customer.get_customer_count
  	@doctor_count = Doctor.get_doctor_count
  	@nurse_count = Nurse.get_nurse_count
  	@treatment_count = Treatment.get_treatment_count
  	@medicine_count = Medicine.get_medicine_count
  	@treatment_all_income = Treatment.get_all_income
  	Log.log(current_user.id,request.remote_ip,'home_index','')
  end
end
