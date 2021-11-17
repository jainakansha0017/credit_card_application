require 'net/http'
class CredibilityScore < ApplicationService
	attr_reader :email
	def initialize(email)
		@email = email
	end

	def call
		# uri = URI.parse("https://api.fullcontact.com/v2/person.json?email=#{email}")
		# http = Net::HTTP.new(uri.host, uri.port)
		# request = Net::HTTP::Get.new(uri.request_uri)
		# request['X-FullContact-APIKey'] = "uA6TuVzTHWADhBuZYaRND38YTsLgFihx"
		# http.use_ssl = true  
		# response = http.request(request)
		# puts response

		rand(0..4)
	end
end