stepping
step

	|  secs delta |
	start ifFalse:[^ self].
	secs := 0.05.
	attractors do:[ :attr |
		delta := attr globalPosition - self globalPosition.
		velocity := velocity + 
			(delta normalized *  (secs * (attr mass/100.0) /  (delta dot: delta))).
	].
	self translation: self translation + (secs * velocity).
	tracer addPath: self  globalPosition.
