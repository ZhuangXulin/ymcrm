class NurseController < ApplicationController
  before_filter :authenticate_user!


  def index
    @nurses = Nurse.get_nurse_list(params[:page])
  end
end
