text support
drawString: s from: startIndex to: stopIndex at: pt font: font color: aColor
	self glColor4f: aColor red with: aColor green with: aColor blue with: aColor alpha.
	self glRasterPos3f: pt x with: pt y with: pt z.
	fontManager drawString: s from: startIndex to: stopIndex font: (font ifNil:[TextStyle defaultFont]) align: nil.