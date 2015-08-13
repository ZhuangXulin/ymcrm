class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  	@customer_count = Customer.get_customer_count
  	@doctor_count = Doctor.get_doctor_count
  	@nurse_count = Nurse.get_nurse_count
  end
end
