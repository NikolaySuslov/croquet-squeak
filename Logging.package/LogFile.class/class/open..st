instance creation
open: filename
	"self open"

	self named: self logDirectory, FileDirectory slash, filename
	