class Customer < ActiveRecord::Base
	belongs_to :city

	def self.search(params)
		#@customers = Customer.find(:all, :conditions => conditions(params))
		if params
			query = params.clone
			query.map { |k,v| query[k] = (("%#{v}%") unless (k == :city_id || v.blank?))||v}
			where((query.map { |f| f[0].to_s + " LIKE :" + f[0].to_s unless f[1].blank? }).reject(&:blank?).join(' AND '), query).order(:lname)
	  else
	    scoped
	  end
	end

end


