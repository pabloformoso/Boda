class BaseController < ApplicationController
  layout "user"
  before_filter :authenticate_user!, :days
  
  def days
    a = Time.gm(2012,12,01)
    b = Time.now
    
    @days = (a - b).to_i / (24 * 60 * 60)
  end
  
end
