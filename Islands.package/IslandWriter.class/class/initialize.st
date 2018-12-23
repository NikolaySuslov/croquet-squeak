class initialization
initialize
	"IslandReader initialize"
	"IslandWriter initialize"

	self initializePreferences.

	CodeNil			:= 1.
	CodeTrue 		:= 2.
	CodeFalse 		:= 3.
	CodeSpecial 		:= 4.

	CodeSmallInteger 			:= 5.
	CodeLargePositiveInteger 	:= 6.
	CodeLargeNegativeInteger 	:= 7.
	CodeFloat 					:= 8.
	CodePoint 					:= 9.

	CodeCharacter 	:= 10.
	CodeByteString 	:= 11.
	CodeByteSymbol	:= 12.
	CodeWideString 	:= 13.
	CodeWideSymbol	:= 14.

	CodeClass 		:= 15.
	CodeMetaclass 	:= 16.

	CodeColor 		:= 17.
	CodeFont 		:= 18.
	CodeArray 		:= 19.

	CodeImageSegment 	:= 20.
	CodeMethodTrigger 	:= 21.
	CodeFieldDefinition	:= 22.

	CodeUUID := 23.
	CodeTForm := 24.
	CodeGlobalRef := 25.

	CodeConstructor := 26.

	SignalFailure := true. "by default signal failures"