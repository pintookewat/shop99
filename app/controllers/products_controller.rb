class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = current_user.products.create(product_params)


      if @product.save
       redirect_to "/products"
      else
        redirect_to "/products/new"
      end

  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
         redirect_to "/products"
      else
        redirect_to "/products/edit"
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy_product
      @product = Product.find(params[:product_id])
      @product.destroy
      redirect_to  "/products"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_id, :product_id,  :default_price, :description, :images,  :price, :name,  :payment_id,  :object,  :url, :price_id, :user_id)
    end
end
