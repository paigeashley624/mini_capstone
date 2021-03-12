class Api::OrdersController < ApplicationController
  def create

    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = product.price * 
    calculated_total = 

    @orders = Order.new ( 
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id],
      subtotal: #needs to be calculated_xyz from the above calculation 
      tax: #needs to be calculated_xyz from the above calculation
      total: #needs to be calculated_xyz from the above calculation
    )
    @order.save
    render "show.json.jb"
  end
end
