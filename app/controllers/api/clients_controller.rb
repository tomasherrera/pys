class Api::ClientsController < ApplicationController
  respond_to :json

  def index
    @clients = Client.all.includes(:client_contacts)
  end

  def show
    @client = Client.find(params[:id])
  end
end
