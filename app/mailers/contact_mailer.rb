class ContactMailer < ApplicationMailer
	default from: "hr@24x7softwares.com"
	
	def contactus contact
		@contact = contact
		mail(to: "info@24x7softwares.com",:from=> contact.email, subject: contact.subject)
	end
end
