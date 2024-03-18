class ItemsController < ApplicationController

 def index
  @items = Item.all
 end

 def new
  @item = item.new
 end

end