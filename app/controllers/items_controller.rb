class ItemsController < ApplicationController
  def index
    @item = item.all
  end

  def new
    @item = item.new
  end

  def create
    
  end



end
