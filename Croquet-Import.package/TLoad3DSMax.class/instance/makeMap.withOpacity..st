parse
makeMap: tree withOpacity: oNameAndMapOrNil

	| txtr fieldName field fname uOffset vOffset uTiling vTiling angle start end name extend dNameAndForm txtrform key |

" Create a texture based upon information found in the material field.
  oMapOrNil, if not nil, is the model's MAP_OPACITY for this model (as a  Form)."

	extend := nil.
	uOffset := 0.0.
	vOffset := 0.0.
	uTiling := 1.0.
	vTiling := 1.0.
	angle := 0.0.
	tree linksDo:[:node |  "linked list for performance"
		fieldName := node name.
		field := node value.
		fieldName = #TBitmap ifTrue:[ 
			start := field findDelimiters:'"' startingAt: 1.
			end := field findDelimiters: '"' startingAt: start+1.
			fname := field copyFrom: start+1 to: end-1.
			].
		fieldName = #TUvwUOffset ifTrue:[ uOffset := self makeNumber: field.].
		fieldName = #TUvwVOffset ifTrue:[ vOffset := self makeNumber: field.].
		fieldName = #TUvwUTiling ifTrue:[ uTiling := self makeNumber: field.].
		fieldName = #TUvwVTiling ifTrue:[ vTiling := self makeNumber: field.].
		fieldName = #TUvwAngle ifTrue:[ angle := self makeNumber: field.].
		fieldName = #TMapName ifTrue:[ name := field. 
				start := name findDelimiters:'$' startingAt: 1.
				start < (name size-1) ifTrue:[
					(name at:(start+1))=$c ifTrue:[extend := #colorKey.].
					(name at:(start+1))=$a ifTrue:[extend := #alpha].
					(name at:(start+1))=$f ifTrue:[extend := #fullBright].
					].
				].
		].
	fname ifNil:[^ nil].
	fname size = 0 ifTrue:[^ nil].
	"get file name from full path name - assumes file is a Windows file name"
	fname := fname reverse.
	end := fname findDelimiters:'\:'startingAt: 1.
	fname := (fname copyFrom: 1 to: end-1) reverse.

	fname ifNil:[^fname].

	oNameAndMapOrNil ifNil: [
		txtr := TTexture new initializeWithFileName: (filePath pathFromURI: fname) mipmap: true shrinkFit: true extension: extend.
	] ifNotNil: [
		dNameAndForm := self makeTextureForm: tree.
		"Check to see if we have this combination already"
		key := (TCryptoRandom hashMessage: dNameAndForm key, oNameAndMapOrNil key) asSymbol.
		txtr := Processor activeIsland at: key ifAbsent:[nil].
		txtr ifNotNil:[^txtr].
		txtrform := self applyOpacity: oNameAndMapOrNil value to: dNameAndForm value.
		txtr := TTexture new initializeWithForm: txtrform mipmap: true shrinkFit: true extension: #alpha.
		txtr registerGlobal: key.
	].

	txtr uvAngle: angle.
	txtr uvOffset: uOffset@vOffset.
	txtr uvScale: uTiling@vTiling.
	txtr objectName: name.
	^ txtr.
	


	