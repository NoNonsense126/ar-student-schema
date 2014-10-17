require_relative '../../db/config'

class Student < ActiveRecord::Base
	validate :validate_phone_number
	email_validation = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z][a-z]+\z/i
	validates :email,
						:format => { :with => email_validation, :message => "Enter a valid Email address!"},
					  :uniqueness => {:case_sensitive => false, :message => "Email already exists!"}
	validates_numericality_of :age, :greater_than => 5

	def name
		"#{first_name} #{last_name}"
	end

	def age
		Time.now.year - birthday.year
	end

	def validate_phone_number
		unless phone.downcase.gsub(/[a-z]/, "").length >= 10
			errors.add(:phone, "Need a valid phone number")	
		end
	end

end
