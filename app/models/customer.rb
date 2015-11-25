class Customer < ActiveRecord::Base
	belongs_to :city
	belongs_to :customers_type

	def self.search(params)
		#@customers = Customer.find(:all, :conditions => conditions(params))
		if params
			query = params.clone
			query.map do |k,v| 
				#puts("k=" + k)
				query[k] = ((k == 'city_id' || v.blank?) ? v : ("%#{v}%"))
			end
			where((query.map { |f| f[0].to_s + " LIKE :" + f[0].to_s unless f[1].blank? }).reject(&:blank?).join(' AND '), query).order(:lname)
			# (f[0].to_s == "city_id" ? " = :" : " LIKE :")
			#(("%#{v}%") unless (k == :city_id || v.blank?))||v
	  else
	    scoped
	  end
	end

end


