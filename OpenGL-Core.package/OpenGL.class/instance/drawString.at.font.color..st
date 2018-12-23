text support
drawString: s at: pt font: aFont color: aColor
	self glRasterPos3f: pt x with: pt y with: pt z.
	self glColor4f: aColor red with: aColor green with: aColor blue with: aColor alpha.
	fontManager drawString: s from: 1 to: s size font: (aFont ifNil:[TextStyle defaultFont])