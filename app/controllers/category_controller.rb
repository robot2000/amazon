class CategoryController < ApplicationController
  
  before_action :define_category, only: [:show]

  def show
    @categories = Category.all
    @books = @category.books
    # @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  private

  def define_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:title)
  end
end
