class TradesController < ApplicationController
  
  def index
    @trades = Trade.all
  end
  
  def new
    @trade = Trade.new
  end
  
  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      flash[:notice] = "Your Trade has been setup, It will show on your trades page."
      redirect_to trade_path(@trade)
    else
      render 'new'
    end
  end
  
  def edit
    @trade = Trade.find(params[:id])
  end
  
  def update
    @trade = Trade.find(params[:id])
    if @trade.update(trade_params)
      flash[:notice] = "Your Trade has been edited."
      redirect_to trade_path(@trade)
    else
      render 'edit'
    end
  end
  
  def show
    @trade = Trade.find(params[:id])
  end
  
  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
    flash[:notice] = "Trade was successfully deleted!"
    redirect_to trades_path
  end
  
  private
    def trade_params
      params.require(:trade).permit(:title, :description)
    end
end