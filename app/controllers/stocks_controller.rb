class StocksController < ApplicationController
   # skip_before_action :verify_authenticity_token
   before_action :set_stock, only: [:show, :edit, :update, :destroy]
   before_filter :authorize
  def index
    @stocks = Stock.all 
    @stock = Stock.new
  end

  def show
    if request.xhr?
      render '_stock', layout: false 
    end
  end

  def new
    @stock = Stock.new
    
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find params[:id]
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to stocks_path, notice: 'Symbol was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end
    

  def create
    @stock = Stock.new(stock_params)
  
    respond_to do |format|
      if @stock.save
          if request.xhr?
            format.html { render 'show', layout: false }
          else
            format.html { redirect_to @stock, notice: 'Symbol was successfully added.' }
            format.json { render :show, status: :created, location: @stock }
          end
      else
         format.html { render :new }
         format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end

    
  end

  private

    def stock_params
      params.require(:stock).permit(:name, :symbol, :price)
    end

    def set_stock
      @stock = Stock.find(params[:id])
    end




end
