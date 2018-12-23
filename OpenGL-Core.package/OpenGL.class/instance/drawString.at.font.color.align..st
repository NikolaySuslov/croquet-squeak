text support
drawString: s at: pt font: aFont color: aColor align: align
	self glColor4f: aColor red with: aColor green with: aColor blue with: aColor alpha.
	self glRasterPos3f: pt x with: pt y with: pt z.
	fontManager drawString: s from: 1 to: s size font: (aFont ifNil:[((TextStyle named: 'Accuny')  ) defaultFont]) align: align.