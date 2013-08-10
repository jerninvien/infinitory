class Institute < ActiveRecord::Base
	has_many :departments, dependent: :destroy
	has_many :labs, dependent: :destroy
	has_many :labs, through: :departments, dependent: :destroy

	validates :name, :address, presence: true

	validates :name, uniqueness: { scope: :address,
    													 message: "This institute is already registered at that address" }

	geocoded_by :address   			# can also be an IP address
	after_validation :geocode   # auto-fetch coordinates

	after_validation :reverse_geocode
	reverse_geocoded_by :latitude, :longitude do |obj,results|
	  if geo = results.first
	    obj.city    = geo.city
	    obj.country = geo.country
	  end
	end

	acts_as_gmappable validation: false

	def gmaps4rails_address
	#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
	  "#{self.latitude}, #{self.longitude}" 
	end
end
