picking
pickLocalBoundSphere: bnds 
	| lpAt position dp dd |

	lpAt := self framePointer row3.
	position := bnds localPosition - self framePosition.
" project center of sphere onto the ray"
	dp := position - (lpAt * (lpAt dot: position)).
	dd := dp dot: dp.

" distance of ray to center - if greater than radius, return false, otherwise, the ray intersects."
	^ (dd < bnds radiusSquared)

