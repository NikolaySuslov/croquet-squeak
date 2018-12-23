instance creation
defaultTForm

	| tform |
	tform := TFormManager default at: 'default' ifAbsentPut:[
		TForm fromForm: TForm defaultForm mipmap: true shrinkFit: true extension: nil.].
	^ tform.
