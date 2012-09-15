class Admin::MainController < Admin::BaseController
  
  def index
    @access_requests = Admin::AccessRequest.not_revised
  end
  
end
