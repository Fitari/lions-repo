class Customer < ActiveRecord::Base
	belongs_to :city

	def self.search(params)
		#@customers = Customer.find(:all, :conditions => conditions(params))
		if params
			where((params.map { |f| f[0].to_s + " LIKE :" + f[0].to_s unless f[1].blank? }).reject(&:blank?).join(' AND '), params)
	  else
	    scoped
	  end
	end

end
