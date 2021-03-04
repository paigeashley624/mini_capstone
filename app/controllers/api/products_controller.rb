class Api::ProductsController < ApplicationController
  def all_products
    @products = Products.all_products
    render "all_products.json.jb"
  end

  def show
    product_id = params [:id]
    @products = Products.first(product_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new (
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      decsription: params[:description]
    )
    @product.save
    render "show.json.jb"
  end

  #complete this section as well. Will need the || for this 
  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)

    @product.name = params[:title] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description

    @product.save 
    render "show.json.jb"
  end

  def destroy
    product_id = params[:id]
    product = Product.find(product_id)
    product.destroy
    render json:(message: "item deleted")

  end
end