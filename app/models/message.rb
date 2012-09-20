class Message < ActiveRecord::Base
  belongs_to :guest, :class_name => "Admin::Guest", :foreign_key => "guest_id"
  attr_accessible :content
end
