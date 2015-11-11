class HomeController < ApplicationController
  before_filter :set_active_tab
	def set_active_tab
	  @active_tab = 1
	end

  def index
  	@customer = Customer.new
  end
end
