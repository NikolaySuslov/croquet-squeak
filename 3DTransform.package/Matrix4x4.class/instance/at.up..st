initialize
at: a up: u
" dominant at vector - up can change. See #up:at:."

	| side up at |
	side := (a cross: u) normalized negated.
	up := (side cross: a) normalized negated.
	at := a normalized.
	self a11: side x.
	self a21: side y.
	self a31: side z.
	self a12: up x.
	self a22: up y.
	self a32: up z.
	self a13: at x.
	self a23: at y.
	self a33: at z.
	self a44: 1.0.
