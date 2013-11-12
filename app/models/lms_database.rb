class LmsDatabase < ActiveRecord::Base
	self.abstract_class = true

	lms_database_url = ENV['LMS_DATABASE_URL']

	if lms_database_url.present?
		establish_connection(
			adapter:  'postgresql',
			host:     url.host, 
			username: url.userinfo.split(':')[0],
			password: url.userinfo.split(':')[1],
			database: url.path[1..-1],
			port:     url.port || 3306
		)
	else 
		establish_connection "lms_#{Rails.env}"
	end
end