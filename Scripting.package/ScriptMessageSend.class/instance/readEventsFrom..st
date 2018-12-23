factory
readEventsFrom: anArray
	| index key value events rcvr sel evtSpec spec |
	events := Array new: anArray size - 1 * 2.
	index := 0.
	2 to: anArray size do:[:idx|
		spec := anArray at: idx.
		key := spec first.
		key == #event ifFalse:[self error:'#event expected'].
		rcvr := sel := nil.
		2 to: spec size do:[:i|
			evtSpec := spec at: i.
			key := evtSpec first.
			value := evtSpec last.
			key == #receiver ifTrue:[rcvr := value].
			key == #selector ifTrue:[sel := value].
		].
		events at: (index := index + 1) put: rcvr.
		events at: (index := index + 1) put: sel.
	].
	eventSpec := events