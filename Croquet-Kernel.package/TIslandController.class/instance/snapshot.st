snapshot
snapshot
	"Create a snapshot of this island"
	| writer file |
	self critical:[
		writer := TSnapshotWriter new.
		"Prepare the island for saving"
		"island ifNil:[self newIsland]."
		island send:[:obj| obj controller: nil].
		writer snapshot: island.
		writer failed ifTrue:[^nil].
		file := (ByteArray new: 4000) writeStream.
		writer saveObjectOn: file.
		self log info: ('Snapshot Size:' , file size printString).
		island send:[:obj| obj controller: self].
	].
	^file contents