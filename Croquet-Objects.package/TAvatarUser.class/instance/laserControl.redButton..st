driving
laserControl: pointer redButton: redButton
	| p0 p1 at up side m st |
	
	redButton ifFalse:[
		lastLength := 0.5.
		laser future length: lastLength.
		laser future orientation: pointer orientation.
		nil. "Don't let above future be in tail position."
	]ifTrue:[
pointer isOverlay ifTrue:[
		laser future length: 0.5.
		laser future orientation: pointer orientation.
		^ self.
	].
pointer selectedTarget ifNotNil:[
		st := pointer selectedTarget.
		pointer selectedPortal ifNotNil:[
			laser future length: lastLength.
			laser future orientation: pointer orientation.
			^ self.
		].
		p0 := laser get:#globalPosition.
		p1 := pointer selectedGlobalPoint.
		p0 := p0-p1.
		at := p0 normalized.
		up := 0@1@0.
		side := (at cross: up) normalized negated.
		up := (side cross: at) normalized negated.
		m := Matrix4x4 identity.
		m a11: side x.
		m a21: side y.
		m a31: side z.
		m a12: up x.
		m a22: up y.
		m a32: up z.
		m a13: at x.
		m a23: at y.
		m a33: at z.
m := self inverseGlobalOrientation composeWith: m.
		laser future orientation: m.
		lastLength := p0 length.
		laser future length: lastLength.
		nil. "Don't let above future be in tail position."
		
	] ifNil:[
		laser future length: 0.5.
		laser future orientation: pointer orientation.
		nil. "Don't let above future be in tail position."
	].
].
		
	head ifNotNil: [
		head future orientation: pointer orientation.
	].