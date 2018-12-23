as yet unclassified
sendMessage: msg
	"Send the message."

"Transcript show: 'Watchdog sending: ', msg;cr."
	toEmail isEmptyOrNil
		ifFalse: [
			self
				mailFrom: FromEmail
				to: (Array with: ToEmail)
				text: 'Subject: Important log messages

Log messages above threshold:
', msg]
