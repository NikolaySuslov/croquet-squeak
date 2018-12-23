render
renderTree: ogl root: root
	| count globalTrans ac |
	ac := ogl camera.
	count := 0.
	"is this inside the viewing pyramid?"
	(ac testSphere: center radius: radius) ifTrue:[
		spheres ifNotNil:[
			spheres do:[:sp | 
				(ac testBounds: sp) ifTrue:[
					ogl pushMatrix.
					ogl glMultMatrixf: sp frame globalTransform transposed.
					sp frame render: ogl. 
					count := count + 1.
					sp frame hasAlpha ifTrue: [ 
						globalTrans := Matrix4x4 new.
						ogl glGetFloatv: GLModelviewMatrix with: globalTrans.
						root addAlphaObject: sp frame 
							transform: globalTrans
							distance: (ac globalPosition - 
								sp globalPosition) squaredLength
							parent: sp frame parent
							transparency: ogl transparency.
						].
					ogl popMatrix.
					].
				].
			].
		qtTL ifNotNil:[ count := count + (qtTL renderTree: ogl root: root).].
		qtTR ifNotNil:[ count := count + (qtTR renderTree: ogl root: root).].
		qtBL ifNotNil:[ count := count + (qtBL renderTree: ogl root: root).].
		qtBR ifNotNil:[ count := count + (qtBR renderTree: ogl root: root).].
		].
	^ count.

