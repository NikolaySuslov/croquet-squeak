as yet unclassified
initialize
	"Default threshold ignores debug and info but includes warnings and worse."

	"self initialize"

	threshold := 4.
	buffer := Timer := nil.
	collectMinutes := 300.
	smtpServer := 'localhost'