class ProductmadeMailer < ApplicationMailer
  def new_product_email
    @products = params[:product]
    user =  @products.user
    mail(to:"#{user.email}", subject: "You Created Product")
  end
end
