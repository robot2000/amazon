class CategoryController < ApplicationController
  
  before_action :define_category, only: [:show]

  def show
    @category = Category.find(params[:id])
    #@books = Book.where(category: @category.id)
    @books = @category.books
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
