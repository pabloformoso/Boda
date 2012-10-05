class Admin::AccessRequest < ActiveRecord::Base

  attr_accessible :email, :name, :revised
  validates :email, :uniqueness => true, :on => :create

  scope :not_revised, where(:revised => false) 
end
