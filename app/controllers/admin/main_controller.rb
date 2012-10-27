class Admin::MainController < Admin::BaseController
  
  def index
    @access_requests = Admin::AccessRequest.all
  end
  
end
