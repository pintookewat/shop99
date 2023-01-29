class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :stripe_api, only: %i[ create  update ]


  def index
    @products = current_user.products
  end

  def show
  end


  def new
    @product = Product.new
  end


  def edit
  end


  def create

    product = current_user.products.create(product_params)

    product_id =  Stripe::Product.create({name: params[:product][:name]})

    product_price = Stripe::Price.create({ unit_amount: params[:product][:price], currency: 'INR', product: product_id[:id]})


    product_url = Stripe::PaymentLink.create({line_items: [{price: product_price[:id],quantity: 1}],})

    if product.update(product_id: product_id[:id], price_id: product_price[:id], url: product_url[:url] )
     redirect_to "/products"
   else
    redirect_to "/products/new"
  end

end


def update
  respond_to do |format|
    if @product.update(product_params)
     redirect_to "/products"
   else
    redirect_to "/products/edit"
  end
end
end

def destroy_product
  @product = Product.find(params[:product_id])
  @product.destroy
  redirect_to  "/products"
end

private

def set_product
  @product = Product.find(params[:id])
end

def stripe_api
  Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
end

def product_params
  params.require(:product).permit(:product_id,  :default_price, :description, :images,  :price, :name,  :payment_id,  :object,  :url, :price_id, :user_id)
end
end
