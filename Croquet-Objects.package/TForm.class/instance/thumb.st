initialize
thumb

	| tsize size thumb tf |
"no sha means there is no external reference, hence no reason to have a thumbnail"	
	sha ifNil:[^self]. 
	size := form width @ form height.
	tsize:= (size*32/size maxDimension) asLargerPowerOfTwo max:1@1.
	thumb := Form extent:tsize depth:32.
	form displayScaledOn:thumb.
	tf := TForm new initialize: url sha:sha copy form: thumb mipmap: bMipmap shrinkFit: bShrinkFit extension: extension. 
	tf extent: extent.
	tf bThumb: true.
	^ tf.