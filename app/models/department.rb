class Department < ActiveRecord::Base
	belongs_to :institute

	has_many :labs, dependent: :destroy

  validates_associated :institute
  validates :name, uniqueness: {scope: :institute_id}, presence: true

	geocoded_by :address   				# can also be an IP address
	after_validation :geocode     # auto-fetch coordinates

end
