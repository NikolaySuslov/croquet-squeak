private
startUpAll: array
	"Send startUp messages to all objects"
	(Delay forMilliseconds: 1000) wait .
	1 to: array size do: [:i | (array at: i) startUpInIslandReader: self].
	^array size