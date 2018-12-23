accessing
at: key 
	"Override Dictionary's at: to answer the value associated with the key but just return nil if the key is absent. "

	^ self at: key ifAbsent: nil