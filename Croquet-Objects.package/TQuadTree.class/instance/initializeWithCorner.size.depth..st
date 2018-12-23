initialize
initializeWithCorner: crnr size: sz depth: dpth

	|  cornerMax |

	self initialize.
	quadSize := sz/2.0.
	quadCorner := crnr shallowCopy.
	quadCorner y: Float infinity.
	cornerMax := crnr + sz.
	cornerMax y: Float infinity negated.
	inBox := TBox new. "min: corner max:cornerMax."
	outBox := TBox new.
	quadCenter := quadCorner + (quadSize/2.0).
	radius := 0.
	self visible: false.
	depth := dpth.
	self quadOn: true.
	^self
