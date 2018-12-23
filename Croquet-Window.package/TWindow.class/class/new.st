as yet unclassified
new
	"TWindow uses disk resources, including expensive ASE importing.  
	 We cache a prototype (an island import/export stream) in the island,
       and create all but the first instance from that."

	| proto result |

	[ 
		proto := Processor activeIsland at: #TWindowProtoData ifAbsent: [nil].
		proto ifNil: [
			proto := TIslandCopier new export:(result := self basicNew initialize).
			Processor activeIsland at: #TWindowProtoData put: proto.
			^ result.
		].
		^ TIslandCopyImporter new importData:proto.

	] ifError: [ : msg |
		Transcript cr; show: 'TWindow prototype failed: ', msg.
		^ self basicNew initialize.
	].

