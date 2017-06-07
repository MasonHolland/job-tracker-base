class CompanyLocation < ActiveRecord::Base
  validates :company_id, presence: true
  validates :location_id, presence: true
  has_many :locations
  has_many :companies
end
