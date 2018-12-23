render
pickSelf: ogl

"This is used when we already (think we) know that we are just re-selecting an already selected object. This is used by TPointer>>#pointerPickCurrent"

	| frame |
	frame := self getOwnedObject: ogl eventPointer selection frameID.
	frame ifNotNil: [
		(ogl eventPointer pointerPick: frame boundSphere) ifFalse: [
			ogl eventPointer selectedGlobalPoint: 
				(self globalTransform localPointToGlobal: ogl eventPointer selectedPoint).
		].
	].