render
pick: pointer

	(pointer pickCylinderFrom: Vector3 new radius: baseRadius 
		to: (Vector3 x:0.0 y: height z: 0.0) radius: topRadius) ifTrue:[^ true] ifFalse:[
			capBase ifTrue:[
				baseRadius > 0.0 ifTrue:[
					(pointer pickCircle: 0@0@0 normal:0@-1@0 radius: baseRadius)ifTrue:[^true].].
				].
			capTop ifTrue:[
				topRadius > 0.0 ifTrue:[
					(pointer pickCircle: 0@height@0 normal:0@1@0 radius: topRadius)ifTrue:[^true]].
				].
			^ false.].