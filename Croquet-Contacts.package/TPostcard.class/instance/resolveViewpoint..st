resolve
resolveViewpoint: ogl

	^(ogl harness findViewpointByPostcard: self) ifNil:[ standin ].