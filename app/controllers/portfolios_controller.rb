class PortfoliosController < ApplicationController
	before_action :portfolio_item, only: [:edit, :show, :update, :destroy]

	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolios_path, notice: "Your portfolio item is live...."}
			else
				format.html { render :new}
			end
		end
	end

	def show

	end

	def edit
	
	end

	def update
		respond_to do |format|
			if @portfolio_item.update(portfolio_params)
				format.html { redirect_to portfolios_path, notice: "record updated"}
			else
				format.html { redirect_to :edit}
			end
		end
	end

	def destroy
		@portfolio_item.destroy
		respond_to do |format|
			format.html { redirect_to portfolios_url, notice: "Record was removed." }
		end
	end

	private

	def portfolio_params
		params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
	end

	def portfolio_item
		@portfolio_item = Portfolio.find(params[:id])
	end
end
