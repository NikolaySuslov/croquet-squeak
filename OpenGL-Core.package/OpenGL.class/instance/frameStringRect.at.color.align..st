text support
frameStringRect: extent at: pt color: aColor align: align
	self glColor4f: aColor red with: aColor green with: aColor blue with: aColor alpha.
	self glRasterPos3f: pt x with: pt y with: pt z.
	fontManager frameStringRect: extent align: align.