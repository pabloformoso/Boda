class Admin::AccessRequestsController < Admin::BaseController
  
  # GET /admin/access_requests
  # GET /admin/access_requests.json
  def index
    @admin_access_requests = Admin::AccessRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_access_requests }
    end
  end

  # GET /admin/access_requests/1
  # GET /admin/access_requests/1.json
  def show
    @admin_access_request = Admin::AccessRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_access_request }
    end
  end

  # GET /admin/access_requests/new
  # GET /admin/access_requests/new.json
  def new
    @admin_access_request = Admin::AccessRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_access_request }
    end
  end

  # GET /admin/access_requests/1/edit
  def edit
    @admin_access_request = Admin::AccessRequest.find(params[:id])
  end

  # POST /admin/access_requests
  # POST /admin/access_requests.json
  def create
    @admin_access_request = Admin::AccessRequest.new(params[:admin_access_request])

    respond_to do |format|
      if @admin_access_request.save
        
        AccessRequestMailer.request_received(@admin_access_request).deliver
        
        format.html { redirect_to @admin_access_request, notice: 'Access request was successfully created.' }
        format.json { render json: @admin_access_request, status: :created, location: @admin_access_request }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_access_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/access_requests/1
  # PUT /admin/access_requests/1.json
  def update
    @admin_access_request = Admin::AccessRequest.find(params[:id])

    respond_to do |format|
      if @admin_access_request.update_attributes(params[:admin_access_request])
        format.html { redirect_to @admin_access_request, notice: 'Access request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_access_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/access_requests/1
  # DELETE /admin/access_requests/1.json
  def destroy
    @admin_access_request = Admin::AccessRequest.find(params[:id])
    @admin_access_request.destroy

    respond_to do |format|
      format.html { redirect_to admin_access_requests_url }
      format.json { head :no_content }
    end
  end
  
  def approve 
    @admin_access_request = Admin::AccessRequest.find(params[:id])
    @user = User.create!(:email => @admin_access_request.email, :password => "boda2012", :password_confirmation => "boda2012")
    if @user
      @guest = Admin::Guest.create(:name => @admin_access_request.name, :user => @user, :has_confirmed => false, :main => true, :number_of_companions => 0)
      @admin_access_request.update_attribute(:revised, true)
      AccessRequestMailer.accept_request(@admin_access_request).deliver
      redirect_to admin_root_path, notice: "Invitado creado"
    else
      redirect_to admin_root_path, notice: "Error al crear el invitado"
    end
  end
  
  def reject
    @admin_access_request = Admin::AccessRequest.find(params[:id])
    @admin_access_request.destroy
    redirect_to admin_root_path, notice: "Solicitud rechazada"
  end
end
