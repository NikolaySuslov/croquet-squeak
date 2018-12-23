private
setStream: aStream
	"PRIVATE -- Initialization method."
	aStream binary.
	basePos := aStream position.	"Remember where we start.  Earlier part of file contains a class or method file-in.  Allow that to be edited.  We don't deal in absolute file locations."
	byteStream := aStream.
	references := IdentityDictionary new: 17.
	objects := IdentityDictionary new: 17.
	fwdRefEnds := IdentityDictionary new.
	skipping := IdentitySet new.
	insideASegment := false.
	blockers ifNil: [blockers := IdentityDictionary new].	"keep blockers we just passed in"
