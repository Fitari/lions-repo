class CustomerController < ApplicationController
  before_filter :set_active_tab
	def set_active_tab
	  @active_tab = 2
	end

  def index
  	@customer = Customer.new
  end

  def search

  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  end

  def create
  	if params[:search]
  		flash[:warning] = nil
  		res = Customer.search(params.require(:customer))
  		c = res.count
  		if c == 0
  			@customer = Customer.new(params.require(:customer).permit!)
  			flash[:warning] = "true"
	      render :index
  		elsif c == 1
  			@customer = res.first
  			redirect_to @customer
  		else
  			redirect_to root_path
  		end
  				

		else
  		@customer = Customer.new(params.require(:customer).permit!)
	    if @customer.save
	      redirect_to @customer
	    else
	      flash[:error] = "There was an error saving the customer. Please try again."
	      render :index
	    end
		end
  end
end
