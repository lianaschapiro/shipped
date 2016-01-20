class Job < ActiveRecord::Base
  belongs_to :boat
  belongs_to :user


  validates_presence_of :name, :cost, :description, :origin, :destination, :containers_needed
  validates :description, length: {minimum: 50}
  validates :cost, numericality: {greater_than: 1000.00}
  validates :origin, inclusion: {in: ["Bermuda", "Dakar", "Miami", "New York City", "Panama", "Trinidad"]}
  validates :destination, inclusion: {in: ["Bermuda", "Dakar", "Miami", "New York City", "Panama", "Trinidad"]}
end
