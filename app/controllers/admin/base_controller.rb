class Admin::BaseController < ApplicationController
  layout 'admin/application'
  before_filter :authenticate_administrator!
end
