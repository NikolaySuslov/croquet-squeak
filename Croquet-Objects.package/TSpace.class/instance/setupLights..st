render
setupLights: ogl

" Enable the closest six lights at full strength, set the next two as a ratio if distance squared, and ignore the rest. The ratios would work as follows:
		distanceRatio := 0.5 * furthest distance/closest distance.
This guarantees the following:
		distanceRatio is always less than 1.0.
		if the two values are very close to each other, then the ratio is about 0.5 : 0.5.
		if one is much closer than the other, then the ratio approaches 0.0 : 1.0."

	| sortedFrames distanceRatio |
	lightFrames size <= 8 ifTrue:[
		lightFrames doWithIndex: [ :lf :i | lf enable: ogl index: i ].
		lightFrames size + 1 to: 8 do: [ :i |
			ogl glDisable: (GLLight0 + i - 1).
		].

 	] ifFalse:[
		lightFrames do:[ :lf | 
			lf distance: (ogl camera globalPosition - lf globalPosition ) squaredLength.].
		sortedFrames := lightFrames sort:[ :a1 :a2 | a1 distance > a2 distance].
		1 to: 6 do:[ :index | (sortedFrames at: index) enable: ogl index: index.].
		distanceRatio := 0.5* ((sortedFrames at: 8) distance)/((sortedFrames at: 7) distance).
		(sortedFrames at: 7) enable: ogl index: 7 scaled: 1-distanceRatio.
		(sortedFrames at: 8) enable: ogl index: 8 scaled: distanceRatio.
	].
