class CartsController < ApplicationController
  before_action :set_cart, only: [:checkout]
  def index
  end

  def show
    @cart = Cart.find_by(params[:id])
    # if @cart.nil?
    #   # @cart = Cart.find_by(params[:id])
    # end
  end

  def checkout
    @cart.checkout
    current_user.current_cart = nil
    # :notice = "You're checked out!"
    redirect_to cart_path(@cart)
  end

  private
  def set_cart
    @cart =Cart.find_by(params[:id])
  end

end
