as yet unclassified
highlightFields: fa

	| ext2 pos cube mat scl fValue |
	fa ifNil:[^ self].
	farray := fa.
	scl := self extent asFloatPoint / targetExtent.
	ext2 := extent/2.0.
	selection ifNotNil:[
		self removeChild: selection.
		selection := nil.].
	selection := TGroup new.
	self addChild: selection.
	farray do:[ :field |
		field value ifNotNil:[
			pos := field key center*scl.
			cube := TCube new.
			fValue :=  field value * scl x *250.
			cube extent: ((field key extent*scl)@fValue).
			cube translation: ((pos x-ext2 x)@(ext2 y-(pos y))@(fValue/2.0)).
			selection addChild: cube.
			mat := TMaterial new.
			fValue >0.0 ifTrue:[ mat color:  #(0.2 0.9 0.2 0.5) asFloatArray.]
			ifFalse:[ 
				fValue<0.0 ifTrue:[mat color:#(0.9 0.2 0.2 0.5)asFloatArray.] ifFalse:
			[mat color:#(0.2 0.2 0.9 0.5)asFloatArray.]].
			cube material: mat.
			cube solid: false.
		].

	].