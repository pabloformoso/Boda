class LandingController < ApplicationController
  def index
    @access_request = Admin::AccessRequest.new
    @user = User.new
    if current_user
      redirect_to home_path
    end
  end
  
  def create_access_request
    @admin_access_request = Admin::AccessRequest.new(params[:admin_access_request])

    respond_to do |format|
      if @admin_access_request.save
        
        AccessRequestMailer.request_received(@admin_access_request).deliver
        
        format.html { redirect_to root_path, notice: 'Gracias por confirmar tu asistencia :)' }
        format.json { render json: @admin_access_request, status: :created, location: @admin_access_request }
      else
        format.html { render action: "index" }
        format.json { render json: @admin_access_request.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
