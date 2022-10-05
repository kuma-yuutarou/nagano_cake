class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :id, :price, :is_active, :image)
  end
end
