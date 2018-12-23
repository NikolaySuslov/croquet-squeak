as yet unclassified
mailFrom: sender to: receivers text: headerAndBody

	| smtpClient |
	smtpClient := SMTPClient new.
	smtpAccount ifNotNil: [
		smtpClient user: smtpAccount; password: smtpPassword.

		[smtpClient openOnHost: (NetNameResolver addressForName: smtpServer timeout: 20) port: 25.
		[smtpClient mailFrom: sender to: receivers text: headerAndBody]
				ensure: [smtpClient close]]
				on: Error do: [:ex |
					self log error: 'Error when sending email: ', ex asString]
	]