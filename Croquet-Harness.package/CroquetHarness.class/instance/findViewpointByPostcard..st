islands
findViewpointByPostcard: pc

	| island rval |
	"Find the island"
	island := self findIslandByPostcard: pc.
	island ifNil:["if not here, try to find it on the net"
		postcard := pc copy.
		^nil].
	"Try to resolve by viewpoint ID"
	pc viewpointID ifNotNil:[
		rval := island send:[ :isl | isl lookup: pc viewpointID].
		rval ifNotNil:[^rval asFarRef].
	].
	"Otherwise use viewpoint name"
	rval := island send:[ :isl | isl at: pc viewpointName].
	^ rval ifNotNil:[rval asFarRef].
