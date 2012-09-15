class BaseController < ApplicationController
  layout "user"
  before_filter :authenticate_user!
  
end
