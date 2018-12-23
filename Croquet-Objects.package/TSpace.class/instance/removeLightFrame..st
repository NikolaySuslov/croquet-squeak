frameManagement
removeLightFrame: ltfrm

	lightFrames remove: ltfrm ifAbsent:[].
"	lightFrames doWithIndex:[ :lf :i| lf = ltfrm ifTrue: [lightFrames remove: i]]."