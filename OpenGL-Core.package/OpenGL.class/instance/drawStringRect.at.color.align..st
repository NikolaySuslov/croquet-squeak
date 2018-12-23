text support
drawStringRect: extent at: pt color: aColor align: align
	self glColor4f: aColor red with: aColor green with: aColor blue with: aColor alpha.
	self glRasterPos3f: pt x with: pt y with: pt z.
	fontManager drawStringRect: extent align: align.