stepping
step

	"interpolate color"
	| timeLeft |
	persist ifFalse:[
		animateTime ifNotNil: [
			timeLeft := animateTime - self now.
			timeLeft <= 0 ifTrue: [
				stepping := false.
				animateTime := nil. 
				frame solidVisibleTree: false. 
				frame2 ifNotNil:[frame2 solidVisibleTree: false. ].
			] ifFalse: [
				color at: 4 put: timeLeft asFloat / self fadeDelay
			].
			self color: color.
		].
	].
	spin ifTrue:[ 
		doSpin ~= 0 ifTrue:[
			doSpin := doSpin + deltaSpin. 
			doSpin < -360 ifTrue:[doSpin := 0.].
			self rotationAroundY: doSpin.
		].
		doSpin = 0 ifTrue:[persist ifTrue:[stepping := false]].
	] ifFalse:[
		persist ifTrue:[stepping := false].
	].
	stepping ifTrue:[(self future: 100) step].