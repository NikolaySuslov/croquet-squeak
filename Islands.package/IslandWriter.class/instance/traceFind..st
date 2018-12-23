private
traceFind: rogueObject
	"Use a checkpoint tracer to find references to the rogue object"
	| tracer info |
	tracer := SnapshotTracer new.
	tracer goals: {rogueObject}.
	tracer segment: segment.
	tracer outPointers: imports.
	info := tracer searchInSegment.
	info inspect.
	tracer basicInspect.