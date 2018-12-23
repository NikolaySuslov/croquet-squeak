picking
pickSphere: loc radiusSquared: rs

	| p dp d dd c |

" This method is used to find the surface of the actual sphere, not just determine if the pointer intersects it."
	rs = 0.0 ifTrue:[^ false.].
	p := loc - self framePosition.
	
" project center of sphere onto the ray"
	dp := self framePointer row3 * (self framePointer row3 dot: p).
	dd := dp - p.
" distance of ray to center - if greater than radius, exit"
	d := dd dot: dd.
	d > rs ifTrue:[^false.].
" calculate the point on the sphere"
	c := (rs-d)sqrt.
	dp := dp + (c * self framePointer row3).
	d := dp dot: dp.
" if it is closer than the current selected object, save and calc norm."
	(self testSelectedDistanceSquared: d) ifTrue: [
		self selectedDistanceSquared: d.
		self selectedPoint: (self framePosition + dp).
		self selectedNormal: (self selectedPoint - loc) normalized.
		^ true.		
		].
	^ false.
