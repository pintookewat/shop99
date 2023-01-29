class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :stripe_api, only: %i[ create  update ]


  def index
    @products = Product.all
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

   Stripe::Product.create({name: 'Gold Special'})
  # Stripe::Product.retrieve('prod_NFp4Uva9N9piKN')

    if product.update(product_id: "pintoo" )
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
