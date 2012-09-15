class Admin::AccessRequest < ActiveRecord::Base

  attr_accessible :email, :name, :revised
  
  scope :not_revised, where(:revised => false) 
end
