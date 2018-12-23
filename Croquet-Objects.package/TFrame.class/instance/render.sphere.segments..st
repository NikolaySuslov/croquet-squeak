render
render: ogl sphere: bndSphr segments: segments
	| position radius ringSin ringCos pi2 seg2 vert rts rbs rtc rbc ax u du v dv |
	position := bndSphr localPosition.
	radius := bndSphr radius.
	seg2 := 1+ (segments * 2) .
	ringSin := FloatArray ofSize: seg2.
	ringCos := FloatArray ofSize: seg2.
	vert := Vector3 new.
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
	1 to: segments do:[ :iv |
		ogl glBegin: GLTriangleStrip.
		u := 0.0.
		1 to: seg2 do: [ :ih | 
			vert x: rts*(ringSin at: ih) y: rtc z: rts*(ringCos at: ih).
			ogl glNormal3fv: vert;
				glTexCoord2f: u with: v;
				glVertex3fv:  (vert * radius)+ position.

			vert x: rbs*(ringSin at: ih) y: rbc z: rbs*(ringCos at: ih).
			ogl glNormal3fv: vert;
				glTexCoord2f: u with: v+dv;
				glVertex3fv:  (vert * radius)+ position.

			u:= u+du.].
		v := v+dv.
		rts := rbs.
		rtc := rbc.
		rbs := ringSin at: iv+1.
		rbc := ringCos at: iv+1.
		ogl glEnd.].

