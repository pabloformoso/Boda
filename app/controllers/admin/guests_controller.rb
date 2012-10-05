class Admin::GuestsController < Admin::BaseController
  # GET /admin/guests
  # GET /admin/guests.json
  def index
    @admin_guests = Admin::Guest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_guests }
    end
  end

  # GET /admin/guests/1
  # GET /admin/guests/1.json
  def show
    @admin_guest = Admin::Guest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_guest }
    end
  end
  
  def list_csv
    @admin_guests = Admin::Guest.all
    respond_to do |format|
      format.csv
    end
  end
  
  # GET /admin/guests/new
  # GET /admin/guests/new.json
  def new
    @admin_guest = Admin::Guest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_guest }
    end
  end

  # GET /admin/guests/1/edit
  def edit
    @admin_guest = Admin::Guest.find(params[:id])
  end

  # POST /admin/guests
  # POST /admin/guests.json
  def create
    @admin_guest = Admin::Guest.new(params[:admin_guest])

    respond_to do |format|
      if @admin_guest.save
        format.html { redirect_to @admin_guest, notice: 'Guest was successfully created.' }
        format.json { render json: @admin_guest, status: :created, location: @admin_guest }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/guests/1
  # PUT /admin/guests/1.json
  def update
    @admin_guest = Admin::Guest.find(params[:id])

    respond_to do |format|
      if @admin_guest.update_attributes(params[:admin_guest])
        format.html { redirect_to @admin_guest, notice: 'Guest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/guests/1
  # DELETE /admin/guests/1.json
  def destroy
    @admin_guest = Admin::Guest.find(params[:id])
    @admin_guest.destroy

    respond_to do |format|
      format.html { redirect_to admin_guests_url }
      format.json { head :no_content }
    end
  end
end
