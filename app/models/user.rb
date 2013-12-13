class User < ActiveRecord::Base
	attr_accessible :name, :email, :phone_number, :type
	validates :name, :email, :phone_number, :type, :presence => true

	validates :email, :phone_number, :uniqueness => true

	after_initialize :ensure_session_token

	def self.generate_session_token
		SecureRandom::urlsafe_base64(16)
	end

	def reset_session_token!
		self.session_token = self.class.generate_session_token
		self.save!
	end

	private

	def ensure_session_token
		self.session_token ||= self.class.generate_session_token
	end
end
