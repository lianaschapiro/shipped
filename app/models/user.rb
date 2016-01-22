class User < ActiveRecord::Base
	has_many :boats, dependent: :destroy
	has_many :jobs, dependent: :destroy
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, length: {in: 4..20}, uniqueness: true
	validates :password, presence: true, length: {in: 4..20}, on: :create
end
