class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :get_price]

  def index
    @items = Item.where("user_id = #{current_user.id}")
  end

  def show
    @previous_prices = @item.previous_prices.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    @item.user = current_user
    if @item.save!
      redirect_to root_path
    else
      render new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save!
      redirect_to root_path
    else
      render edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def get_price
  end

  private

  def set_item
    if Item.find(params[:id]).user == current_user
      @item = Item.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :image, :url, :current_price, :shop_id)
  end
end
