class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company

  helper_method :cities_find

  def cities_find
    cities = self.locations.map do |location|
      location.city
    end
    cities
  end
end
