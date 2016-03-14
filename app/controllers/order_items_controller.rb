class OrderItemsController < ApplicationController
  
  include CurrentOrder
  
  before_action :set_order, only: [:create]
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]


  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def new
    @order_item = OrderItem.new
  end

  def edit
  end


  def create
    @order.add_book(params[:order_item][:book_id], params[:order_item][:quantity].to_i)
    redirect_to :back
  end

  
  # def create

  #   book = Book.find(params[:order_item][:book_id])
  #   # @order_item = @order.order_items.build(book: book, price: book.price, quantity: params[:order_item][:quantity])
  #   @order_item = @order.add_book(book.id)

  #   respond_to do |format|
  #     if @order_item.save
  #       format.html { redirect_to @order_item.order,
  #         notice: 'Order item was successfully created.' }
  #       format.json { render action: 'show',
  #         status: :created, location: @order_item }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @order_item.errors,
  #         status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    @order_item.update(order_item_params)
    render nothing: true
  end

  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to :back, :notice => 'Item has been removed from your cart.' }
      format.json { head :ok }
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_item_params
    params.require(:order_item).permit(:book_id, :price, :quantity)
  end
end
