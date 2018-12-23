class initialization
initialize
	"TLoad3DSMax initialize"
	DelimSet1 := CharacterSet newFrom: '*{}'.
	DelimSet2 := CharacterSet newFrom: ' {}	',Character cr asString,Character lf asString.
	DelimSet3 := CharacterSet newFrom: '*}'.
	NumberSet := CharacterSet newFrom: '-0.123456789'.  "normals start with - or 0"
	WhiteSpaceSet :=  CharacterSet newFrom: (Array with: Character space with: Character tab).
