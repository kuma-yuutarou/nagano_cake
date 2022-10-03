class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @items = Items.new
  end

  def show
  end

  def edit
  end
end
