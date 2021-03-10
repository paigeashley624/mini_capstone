class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    product_id = params[:id]
    @product = Product.find(product_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      decsription: params[:description],
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 406
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)

    @product.name = params[:title] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 406
    end
  end

  def destroy
    product_id = params[:id]
    product = Product.find(product_id)
    product.destroy
    render json: { message: "item deleted" }
  end

  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, if: -> { request.format.html? }

    def current_user
      auth_headers = request.headers["Authorization"]
      if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
        token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
        begin
          decoded_token = JWT.decode(
            token,
            Rails.application.credentials.fetch(:secret_key_base),
            true,
            { algorithm: "HS256" }
          )
          User.find_by(id: decoded_token[0]["user_id"])
        rescue JWT::ExpiredSignature
          nil
        end
      end
    end

    helper_method :current_user

    def authenticate_user
      unless current_user
        render json: {}, status: :unauthorized
      end
    end
  end
end
