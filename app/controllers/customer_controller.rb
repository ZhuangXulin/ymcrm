class CustomerController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @customers = Customer.get_customer_list(nil,nil)
    puts '-------------------'
    puts current_user.id
    puts '------------------'
  end
  
  def new
    @customer = Customer.new
    if !params[:cid].blank?
      puts '++++++++++++++++'
      puts params["cid"]
    end
  end
  
end
