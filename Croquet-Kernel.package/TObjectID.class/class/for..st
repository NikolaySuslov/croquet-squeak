instance creation
for: anObject

	"Generate a TObjectID.  
	The result depends only on the active Island's random stream.
	If logging is enabled, anObject will be logged with the new ID.
	The argument anObject plays no role other than being logged."

	| result |
	true ifTrue: [
		^ self new: 16. 	"fast path - no logging"
	].

	result := self new:16.

	"If the fast path is disabled, the following code prints
	 a transcript of every Croquet TObjectID as it is generated.
	 Slow, but helpful for pinpointing problems with replication divergence.
	 We transcript only the ID's claimed in Croquet islands...
	 to cut noise from the controller/router messaging system."

	(Processor activeIsland isKindOf: TIsland) ifTrue: [
		Transcript cr; 
			show: result asString, ' for ', anObject, ' in ', (Processor activeIsland name).
	].
	^result
