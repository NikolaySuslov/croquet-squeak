picking
pickDownSphere: bnds 
	| position |

	position := bnds globalPosition - self globalPosition.
	^ (((position x *position x) + (position z*position z)) < bnds radiusSquared).
