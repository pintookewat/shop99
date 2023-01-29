class User::UserController < ApplicationController
  before_action :authenticate_user!
  
  def index

    user = User.where.not(:id=>current_user.id)
 #  @products = user.qrcodes
    
  end

  
  def dahsboard
  end

end
