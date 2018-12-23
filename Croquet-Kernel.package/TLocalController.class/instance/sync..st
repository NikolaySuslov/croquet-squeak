actions
sync: resID
	"For local islands, this is a no-op but create a proper (e.g., resolved) promise"
	| promise |
	promise := TPromise new.
	promise resolve: nil.
	^promise