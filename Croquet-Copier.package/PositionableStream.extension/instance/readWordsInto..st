*Croquet-Copier
readWordsInto: aBitmap 
	| blt string |
	string := self next: aBitmap basicSize * 4.
	blt := (BitBlt current toForm: (Form new hackBits: aBitmap)) 
				sourceForm: (Form new hackBits: string).
	blt combinationRule: Form over.  "store"
	blt sourceX: 0; sourceY:  0; height: aBitmap basicSize; width: 4.
	blt destX: 0; destY: 0.
	blt copyBits.
	^ aBitmap
