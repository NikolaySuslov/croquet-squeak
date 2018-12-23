comparing
intersectV1: v1 V2: v2 V3: v3

	| poly |
	(self less: minCorner x t1: v1 x t2: v2 x t3: v3 x) ifTrue:[^ false].
	(self more: maxCorner x t1: v1 x t2: v2 x t3: v3 x) ifTrue:[^ false].
	(self less: minCorner y t1: v1 y t2: v2 y t3: v3 y) ifTrue:[^ false].
	(self more: maxCorner y t1: v1 y t2: v2 y t3: v3 y) ifTrue:[^ false].
	(self less: minCorner z t1: v1 z t2: v2 z t3: v3 z) ifTrue:[^ false].
	(self more: maxCorner z t1: v1 z t2: v2 z t3: v3 z) ifTrue:[^ false].
	poly := Array with:v1 with:v2 with: v3.

	((poly := self clipPoly: poly plane: #(1 0 0) d: minCorner x negated) size < 3)ifTrue:[^false.].
	((poly := self clipPoly: poly plane: #(-1 0 0) d: maxCorner x) size < 3)ifTrue:[^false.].
	((poly := self clipPoly: poly plane: #(0 1 0) d: minCorner y negated) size < 3)ifTrue:[^false.].
	((poly := self clipPoly: poly plane: #(0 -1 0) d: maxCorner y) size < 3)ifTrue:[^false.].
	((poly := self clipPoly: poly plane: #(0 0 1) d: minCorner z negated) size < 3)ifTrue:[^false.].
	((poly := self clipPoly: poly plane: #(0 0 -1) d: maxCorner z) size < 3)ifTrue:[^false.].

	^ true.