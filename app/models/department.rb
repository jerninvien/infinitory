class Department < ActiveRecord::Base
	belongs_to :institute
	validates_associated	:institute
  validates :institute, presence: true

	has_many :labs
	has_many :users

	before_validation :smart_add_url_protocol, :default_addresses

	validates :url, presence: true, url: true, allow_blank: true
  validates :linkedin_url, presence: true, url: true, allow_blank: true
  validates :xing_url, presence: true, url: true, allow_blank: true
  validates :twitter_url, presence: true, url: true, allow_blank: true
  validates :facebook_url, presence: true, url: true, allow_blank: true
  validates :google_plus_url, presence: true, url: true, allow_blank: true

  validates :name, presence: true, 
  								 uniqueness: { scope: :institute_id, case_sensitive: false, message: "A department with that name is already registered at this institute." }

  attr_accessor :delete_icon
  attr_reader :icon_remote_url
  before_validation { icon.clear if delete_icon == '1' }
  has_attached_file :icon, styles: { thumb: '50x50>', portrait: '300x300>' }
  validates_attachment :icon, :size => { :in => 0..2.megabytes, message: 'Picture must be under 2 megabytes in size' }
  validates_attachment_content_type :icon, :content_type => /^image\/(png|gif|jpeg)/, :message => 'only (png/gif/jpeg) images'
  process_in_background :icon
	
	def icon_remote_url=(url_value)
     if url_value.present?
      self.icon = URI.parse(url_value)
      @icon_remote_url = url_value
    end
  end

	geocoded_by :address # can also be an IP address
	reverse_geocoded_by :latitude, :longitude do |obj,results|
	  if geo = results.first
	    obj.city    = geo.city
	    obj.country = geo.country
	  end
	end

	def location
		if self.room.present?
			"#{room} #{address}"
		else
			"#{address}"
		end
	end

	protected

		def smart_add_url_protocol
			if self.url.present?
			  unless self.url[/^http:\/\//] || self.url[/^https:\/\//]
			    self.url = 'http://' + self.url
			  end
			end
		end

		def default_addresses
			if self.institute.present?
				self.address = self.institute.address if self.address.blank?
				self.url = self.institute.url if self.url.blank?
				if self.longitude.nil?
					self.longitude = self.institute.longitude
					self.latitude = self.institute.latitude
				end
			end
		end
end
