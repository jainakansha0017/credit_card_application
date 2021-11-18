require 'webmock'
class CredibilityScore < ApplicationService
	include WebMock::API
	attr_reader :email
	WebMock.enable!
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

		res = stub_request(:any, "https://api.fullcontact.com/v2/person.json?email=#{email}")
      .to_return(
        status: 200,
        body: {
	        requestId: "e158b690-4c96-4542-bd1a-f5a374580156",
	        likelihood: 0.95,
	        contactInfo: {
	        	familyNAme: "Raphy",
	        	fullName: "Renil Raphy",
						givenName: "Renil"
					},
					organizations: [ {
					isPrimary: false,
					name: "Skreem",
					startDate: "2016-03",
					title: "Software Developer",
					current: true
					}, {
					isPrimary: false,
					name: "Carettech Cosultancy Ltd",
					startDate: "2013-10",
					title: "Junior Software Engineer",
					current: true
					} ],
					demographics: {
					locationDeduced: {
						deducedLocation: "Thrissur, Kerala, India",
						city: {
							deduced: false,
							name: "Thrissur"
						},
						state: {
							deduced: false,
							name: "Kerala"
						},
						country: {
							deduced: false,
							name: "India",
							code: "IN"
						},
						continent: {
							deduced: true,
							name: "Asia"
						},
						county: {
							deduced: true,
							name: "Thrissur District"
						},
					likelihood: 1.0
	        },
					gender: "Male",
					locationGeneral: "Thrissur, Kerala, India"
					},
					socialProfiles: [ {
						bio: "I am working on Web applications mainly in 'Ruby on Rails', and have knowledge in
						Django' framework too.",
						followers: 272,
						following: 272,
						type: "linkedin",
						typeId: "linkedin",
						typeName: "LinkedIn",
						url: "https://www.linkedin.com/in/renil-raphy-16a35661",
						username: "renil-raphy-16a35661",
						id: "218837602"
					}, {
						followers: 28,
						following: 34,
						type: "twitter",
						typeId: "twitter",
						typeName: "Twitter",
						url: "https://twitter.com/renilraphyp100",
						username: "renilraphyp100",
						id: "1269251400"
						}
					]
					}.to_json 
      )

      JSON.parse(res.response.body)["socialProfiles"].size
	end
end