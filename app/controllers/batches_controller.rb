class BatchesController < ApplicationController
  def index
    @batches = Batch.paginate(page: params[:page]).order('created_at DESC')
  end

  def new
    @batch = Batch.new
  end

  def create
    if Sale.import(params[:file])
      redirect_to root_url, notice: "Sales imported."
    else
      render :new, notice: "Error, there were problems importing your file."
    end
  end

  def show
    @batch = Batch.includes(:sales).find(params[:id])
    @sales = @batch.sales.paginate(page: params[:page])
  end
end
