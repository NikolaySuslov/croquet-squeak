public
snapshot: island
	| segSize remain lastObject |
	lastObject := Object new.

	"assemble the roots for this island"
	roots := self rootsOf: island.
"	QLogger logInfo: 'SNAPSHOT at island time ', ((island send:[ : o | o time ])asInteger).	"
	self validateRoots: roots.

	self lockRefsDuring:[
		"Create image segment"
		segSize := 1024*1024.
		[
		segment := nil.		"Make these unreachable, before reallocating."
		imports := nil.
		segment := WordArrayForSegment new: segSize.
		imports := Array new: segSize // 4.
		(self
			storeSegmentFor: roots
			into: segment
			outPointers: imports) == nil
		] whileTrue:[segSize := (segSize * 2)].
	].
	remain := self filterOut: imports.
	remain size > 0 ifTrue:[
		| tracer info |
		SignalFailure == true ifTrue:[CheckpointFailure signal].
		tracer := SnapshotTracer new.
		tracer lastObject: lastObject.
		tracer roots: roots.
		tracer goals: remain.
		tracer segment: segment.
		tracer outPointers: imports.
		tracer context: thisContext sender.
		info := tracer search.
		self openWorkspace: info label: 'WARNING!!!'.
		tracer basicInspect.
		^nil
	].
	Preferences projectSpaceAnalysis ifTrue:[
		| info |
		info := String streamContents:[:s|
			self printOutPointerAnalysis: imports on: s.
			s cr; cr.
			self printSpaceAnalysisOn: s.
		].
		self openWorkspace: info label: 'Info: ', island name.
	].