class User < ActiveRecord::Base
	has_many :boats, dependent: :destroy
	has_many :jobs, dependent: :destroy

	has_secure_password
	validates_confirmation_of :password

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, length: {in: 4..20}, uniqueness: true
	validates :password, presence: true, length: {in: 4..20}
end
