transform
transform: trans

	trans ifNotNil:[
		globalPosition := trans localPointToGlobal: localPosition.] 
	ifNil: [globalPosition := localPosition.].

" As far as I can tell, we never need to transform the children boundSpheres.

	children ifNotNil:[
		leaf ifFalse:[
		children do:[:cs | cs transform: trans.].].]."
