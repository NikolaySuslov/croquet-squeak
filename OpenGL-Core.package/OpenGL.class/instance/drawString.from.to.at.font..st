text support
drawString: s from: startIndex to: stopIndex at: pt font: font
	self glRasterPos3f: pt x with: pt y with: pt z.
	fontManager drawString: s from: startIndex to: stopIndex font: (font ifNil:[TextStyle defaultFont]) align: nil.