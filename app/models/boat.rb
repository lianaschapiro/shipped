class Boat < ActiveRecord::Base
  belongs_to :user
  has_many :jobs, dependent: :destroy

  validates_presence_of :name, :location, :containermax
  validates :name, uniqueness: true
  validates :location, inclusion: {in: ["Bermuda", "Dakar", "Miami", "New York City", "Panama", "Trinidad"]}
end
