picking
globalTransformUpdate
	
	|trans|

	downRay ifTrue:[
		trans := self globalPosition.
		globalTransform := TDownRay shallowCopy.
		globalTransform translation: trans.
	].