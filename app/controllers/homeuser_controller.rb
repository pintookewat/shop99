class HomeuserController < ApplicationController
  before_action :authenticate_user!
  
  def index

  user = User.where.not(:id=>current_user.id)
  @products = Product.all    
  end

  
  def dashboard
  end
end
