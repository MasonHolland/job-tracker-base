class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :company_locations
  has_many :locations, through: :company_locations
end
