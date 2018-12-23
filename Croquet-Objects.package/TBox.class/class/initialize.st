class initialization
initialize
	"TBox initialize"

	"Bullet-proof initialization against missing Float>>epsilon"
	Epsilon := [Float epsilon] on: Error do:[:ex | ex return: 0.000000000001].