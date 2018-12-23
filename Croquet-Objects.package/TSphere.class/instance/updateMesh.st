initialize
updateMesh
	| position radius ringSin ringCos pi2 seg2 vert norm texCoord rts rbs rtc rbc ax u du v dv count stream |

	position := boundSphere localPosition.
	radius := boundSphere radius.
	seg2 := 1+ (segments * 2) .
	ringSin := FloatArray ofSize: seg2.
	ringCos := FloatArray ofSize: seg2.
	vert := Vector3 new.
	norm := Vector3 new.
	texCoord := Vector2 new.
	pi2 := Float pi *2.0.

	1 to: seg2-1 do:[ :index | 
		ax := ((index) * pi2)/ (seg2-1).
		ringSin at:index put: ax sin.
		ringCos at:index put: ax cos.].
	ringSin at: seg2 put: (ringSin at: 1).
	ringCos at: seg2 put: (ringCos at: 1).

	rts := 0.0.
	rtc := 1.0.
	rbs :=ringSin at: 1.
	rbc := ringCos at: 1.
	du := 1.0/(seg2-1).
	v := 0.0.
	dv := 1.0/segments.

	vertexBuffer := Vector3Array ofSize: (segments+1)*seg2.
	normalBuffer := Vector3Array ofSize: (segments+1)*seg2.
	texCoordBuffer := Vector2Array ofSize: (segments+1)*seg2.
	count := 1.

	"Create geometry."
	1 to: segments+1 do:[ :iv |
		u := 0.0.
		1 to: seg2 do: [ :ih | 
			norm x: rts*(ringSin at: ih) y: rtc z: rts*(ringCos at: ih).
			vert := (norm*radius) + position.
			texCoord u: u v: v.
			vertexBuffer at: count put: vert.
			normalBuffer at: count put: norm.
			texCoordBuffer at: count put: texCoord.
			count := count + 1.
			u:= u+du.].
		v := v+dv.
		rts := rbs.
		rtc := rbc.
		rbs := ringSin at: iv+1.
		rbc := ringCos at: iv+1.].

	"Create face groups."
	faceGroups := OrderedCollection new.
	0 to: segments-1 do: [:iv |
		faceGroups add: 1.	"material index"
		stream := WriteStream on: IntegerArray new.
		0 to: seg2-1 do: [:ih |
			stream nextPut: iv*seg2 + ih.
			stream nextPut: (iv+1)*seg2 + ih].
		faceGroups add: stream contents].

	self faceGroups: faceGroups.  "init faceBuffers"

	changed := false.
	

