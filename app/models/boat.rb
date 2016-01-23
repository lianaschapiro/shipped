class Boat < ActiveRecord::Base
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :userfollowboats
  has_many :userfollowers, through: :userfollowboats, source: :user

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/boatmissing.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :name, :location, :containermax
  validates :name, uniqueness: true
  validates :location, inclusion: {in: ["Bermuda", "Dakar", "Miami", "New York City", "Panama", "Trinidad"]}
end

