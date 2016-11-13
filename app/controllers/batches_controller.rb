class BatchesController < ApplicationController
  def index
    @batches = Batch.all
  end

  def new
    @batch = Batch.new
  end

  def create
    Sale.import(params[:file])
    redirect_to root_url, notice: "Sales imported."
  end

  def show
    @batch = Batch.find(params[:id])
  end
end
