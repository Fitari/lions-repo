class CustomersController < ApplicationController
  respond_to :html, :js

  before_filter :set_active_tab
	def set_active_tab
	  @active_tab = 2
	end

  def index
  	flash[:warning] = nil
  	@customer = Customer.new
  end

  def search
  	flash[:warning] = nil
		res = Customer.search(params.require(:customer))
		c = res.count
		if c == 0
			@customer = Customer.new(customer_params)
			flash[:warning] = "true"
      render :index
		elsif c == 1
			@customer = res.first
			redirect_to @customer
		else
			redirect_to root_path
		end
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	flash[:notice] = nil
  	flash[:error] = nil
    if @customer.update_attributes(customer_params)
      flash[:notice] = "true"
      redirect_to @customer
    else
      flash[:error] = "true"
      render :show
		end
  end

  def create
  		@customer = Customer.new(customer_params)
  	if params[:search]
  		#redirect_to customers_search_path(customer: @customer.attributes)
		
		else
	    if @customer.save
	      redirect_to @customer
	    else
	      flash[:error] = "true"
	      render :index
	    end
		end
  end

  private

  def customer_params
    params.require(:customer).permit!
  end

end