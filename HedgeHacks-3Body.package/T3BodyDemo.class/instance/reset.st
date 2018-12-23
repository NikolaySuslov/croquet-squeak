events
reset

	| moonEarthDistance earthRadius moonRadius |
	earth translation: -10@10@-15.
	moonVelocity := 29.59@0@0.
	earthRadius := 12756/2.0.
	moonRadius := 3476/2.0.
	moonEarthDistance := 384400.
	moon radius: earth radius * moonRadius/earthRadius.
	moon translation: earth translation + (0@0@80). "((earth radius * moonEarthDistance/earthRadius)/15.0))."
	stepRemainder := 0.
	thirdBody reset.

