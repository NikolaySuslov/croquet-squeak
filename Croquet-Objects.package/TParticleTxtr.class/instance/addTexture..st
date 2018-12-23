initialize
addTexture: txtr

	texture := txtr.
	rectangle := TRectangle new extent: txtr extent.
"	pTexture ifNil:[ textures := OrderedCollection new.
					pTexture := OrderedCollection ofSize: size.
					1 to: size do:[:index | pTexture at: index put: txtr.].
					].
	textures add: txtr."