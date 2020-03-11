class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update,
                                            :show, :create, :destroy]
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular_items
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def show; end

  def create
    respond_to do |format|
      if @portfolio_item.save
        format.html do
          redirect_to portfolios_path, notice: 'Your portfolio item is now live'
        end
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html do
          redirect_to portfolios_path, notice: 'Record successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html do
        redirect_to portfolios_path, notice: 'Portfolio Item removed.'
      end
    end
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                        technologies_attributes: [:name])
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
end
