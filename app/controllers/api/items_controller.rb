class Api::ItemsController < ApplicationController
  respond_to :json 

  def index
    @items = Item.includes(:batch_items).all
  end
end
