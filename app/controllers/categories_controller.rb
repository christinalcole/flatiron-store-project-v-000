class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find_by(params[:id])
  end
end
