class HomeuserController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.where.not(id: current_user.id)
    @products = Product.all
  end

  def dashboard; end

  def google_analytics
  
  end

  def add_cart
    user_cart = current_user.carts
    product = Product.find(params[:id])

    cart = current_user.cart
    Cart.update(product_id: product.id)
  end
end
