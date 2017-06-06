class Location < ActiveRecord::Base
  validates :city, :company_id, presence: true
  belongs_to :company
end
