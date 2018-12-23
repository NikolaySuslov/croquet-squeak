initialize
up: u at: a

" dominant up vector - at can change. See #at:up."

	| side up at |
	side := (a cross: u) normalized negated.
	at := (u cross: side) normalized negated.
	up := u normalized.
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
