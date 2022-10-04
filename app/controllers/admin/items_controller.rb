class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
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
    params.require(:item).permit(:name, :introduction, :genre_id, :id, :price, :is_active)
  end
end
