class Admin::Guest < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  attr_accessible :city, :has_confirmed, :lastname, :name, :number_of_companions, :user
  
  scope :confirmed, where(:has_confirmed => true)
  scope :not_confirmed, where(:has_confirmed => false)
end
