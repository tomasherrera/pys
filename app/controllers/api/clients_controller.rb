class Api::ClientsController < ApplicationController
  respond_to :json

  def index
    @clients = Client.includes(:main_contact).all
  end

  def show
    @client = Client.includes(:client_contacts).find(params[:id])
  end
end
