streaming
next
	| prev now next |
	size > 1 ifTrue:["READ THE CLASS COMMENT!!!"
		prev := firstEvent.
		now := firstEvent priorEvent.
		firstEvent priorEvent: nil.
		[now == nil] whileFalse:[
			"Change link now->next to now->prev"
			next := now priorEvent.
			now priorEvent: prev.
			prev := now.
			now := next].
	].
	next := lastEvent.
	lastEvent := firstEvent := nil.
	size := 0.
	^next