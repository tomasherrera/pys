class Api::BillsController < ApplicationController
  respond_to :json

  def index
    @bills = Bill.all.includes(:client, :order, :user).order("created_at DESC")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @bill = Bill.new
    @bill.client = Client.find(params[:client_id])
    @bill.user = current_user
    @bill.payment_form = params[:payment_form]
    @bill.status = params[:status] 
    @bill.save!
  end

  def update
  end

  def destroy
  end
end
