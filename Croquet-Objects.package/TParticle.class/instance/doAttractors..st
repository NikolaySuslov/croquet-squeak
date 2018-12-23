stepping
doAttractors: secs

	| loc v n |

	attractors do:[:attr |  
		attr hard ifTrue:[
			loc:=attr globalPosition.
			1 to: size do:[:index | attrArray at: index put: loc.].
			attrArray -= pLastPosition.
			attrArray squaredLengthInto: lengthArray.
			attrArray divideByArray: (lengthArray sqrted).
			1 to: size do:[:index | 
				(lengthArray at: index)<attr radiusSquared ifTrue:[ 
					v := pVelocity at: index.			
					n := attrArray at: index.
					pVelocity at:index put: v-(2*n*(v dot: n)).
					attrArray at: index put: (0.0@0.0@0.0). "This sets force inside sphere to 0"
				].
			].
			attrArray divideByArray: lengthArray.
			attrArray *= (attr mass*secs).
			pVelocity += attrArray.
		]ifFalse:[
			loc:=attr globalPosition.
			1 to: size do:[:index | attrArray at: index put: loc.].
			attrArray -= pLastPosition.
			attrArray squaredLengthInto: lengthArray.
			attrArray divideByArray: (lengthArray sqrted).
			1 to: size do:[:index | 
				(lengthArray at: index)<attr radiusSquared ifTrue:[ 
				((lengthArray at: index))<(attr radiusSquared) ifTrue:[pLifetime at: index put:-1.]
				ifFalse:[
					v := pVelocity at: index.			
					n := attrArray at: index.
					pLastPosition at:index put: loc-(n*attr radius).
					attrArray at: index put: (0.0@0.0@0.0). 
				].
				].
			].
			attrArray divideByArray: lengthArray.
			attrArray *= (attr mass*secs).
			pVelocity += attrArray.
		].
	].
