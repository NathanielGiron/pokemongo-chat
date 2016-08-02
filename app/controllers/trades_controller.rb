class TradesController < ApplicationController
  def new
    @trade = Trade.new
  end
  
  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      flash[:notice] = "Your Trade has been setup, It will show on your trades page"
      redirect_to trade_path(@trade)
    else
      render 'new'
    end
  end
  
  def show
    @trade = Trade.find(params[:id])
  end
  
  private
    def trade_params
      params.require(:trade).permit(:title, :description)
    end
end