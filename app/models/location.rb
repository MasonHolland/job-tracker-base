class Location < ActiveRecord::Base
  validates :area, presence: true
  has_many :company_locations
  has_many :companies, through: :company_locations
end
