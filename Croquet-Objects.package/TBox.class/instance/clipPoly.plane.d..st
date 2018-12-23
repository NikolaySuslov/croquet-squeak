private
clipPoly: clipPoly plane: pl d: d

	| poly v1 d1 d2 plane |

"negative d1, d2 means the vector is 'outside' the plane"

	poly := OrderedCollection new.
	plane := pl asFloatArray.
	v1 := clipPoly last.
	d1 := (plane dot: v1) + d.
	clipPoly do:[ :v2 | 
		d2 := (plane dot:v2)+d.
		d2>= 0 ifTrue:[           
			d1>=0 ifTrue:[poly add: v2] "**** d1<=0 - d2<=0"
			ifFalse:[poly add:(self splitv1:v1 v2:v2 d1:d1 negated d2:d2).
					poly add:v2.] "****d1>=0 - d2>=0"
		]ifFalse:[
			d1>=0 ifTrue:[ poly add:(self splitv1: v1 v2: v2 d1:d1 d2:d2 negated).]. "****d1<0 - d2>=0"
		].
		v1 := v2.
		d1 := d2.
	].
	^ poly.