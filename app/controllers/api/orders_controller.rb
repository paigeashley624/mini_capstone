class Api::OrdersController < ApplicationController
  def create
    @orders = Orders.new { 
      quantity: params[:quantity]
      product_id: params[:product_id]
      user_id: params[:user_id]
      total: params[:total]
      subtotal: params[:subtotal]
      tax: params[:tax]
    }
    render "show.json.jb"
  end
end
