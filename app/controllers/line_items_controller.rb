class LineItemsController < ApplicationController
  def create
    # new_cart = current_user.carts.create
    # current_user.current_cart = new_cart unless current_user.current_cart
    current_user.current_cart ||= current_user.carts.create
    line_item = current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_user.current_cart)
    else
      redirect_to store_path
    end
  end

end
