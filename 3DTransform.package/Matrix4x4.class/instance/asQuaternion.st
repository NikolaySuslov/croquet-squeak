converting
asQuaternion
	"Convert the matrix to a quaternion"

	| x y z a a2 x2 y2 a4 |

	a2 := 0.25 * (1.0 + (self a11) + (self a22) + (self a33)).

	(a2 > 0) ifTrue: [
						a := a2 sqrt.
						a4 := 4.0 * a.
						x := ((self a32) - (self a23)) / a4.
						y := ((self a13) - (self a31)) / a4.
						z := ((self a21) - (self a12)) / a4.
					]
			ifFalse: [
						a := 0.
						x2 := -0.5 * ((self a22) + (self a33)).
						(x2 > 0) ifTrue: [
											x := x2 sqrt.
											x2 := 2 * x.
											y := (self a21) / x2.
											z := (self a31) / x2.
										]
								ifFalse: [
											x := 0.
											y2 := 0.5 * (1.0 - (self a33)).
											(y2 > 0) ifTrue: [
																y := y2 sqrt.
																y2 := 2 * y.
																z := (self a32) / y2.
															]
													ifFalse: [
																y := 0.0.
																z := 1.0.
															]
										]
					].

	^ (Quaternion a: a b: x c: y d: z).
