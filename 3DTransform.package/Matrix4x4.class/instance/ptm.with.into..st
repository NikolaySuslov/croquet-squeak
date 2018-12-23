private
ptm: m1 with: m2 into: m3
	"Perform a 4x4 matrix multiplication
		m2 * m1 = m3
	being equal to first transforming points by m2 and then by m1.
	Note that m1 may be identical to m3.
	NOTE: The primitive implementation does NOT return m3 - and so don't we!"
	| c1 c2 c3 c4 |

	m2 == m3 ifTrue:[^self error:'Argument and result matrix identical'].
	c1 := ((m1 a11 * m2 a11) + (m1 a12 * m2 a21) + 
				(m1 a13 * m2 a31) + (m1 a14 * m2 a41)).
	c2 := ((m1 a11 * m2 a12) + (m1 a12 * m2 a22) + 
				(m1 a13 * m2 a32) + (m1 a14 * m2 a42)).
	c3 := ((m1 a11 * m2 a13) + (m1 a12 * m2 a23) + 
				(m1 a13 * m2 a33) + (m1 a14 * m2 a43)).
	c4 := ((m1 a11 * m2 a14) + (m1 a12 * m2 a24) + 
				(m1 a13 * m2 a34) + (m1 a14 * m2 a44)).

	m3 a11: c1; a12: c2; a13: c3; a14: c4.

	c1 := ((m1 a21 * m2 a11) + (m1 a22 * m2 a21) + 
				(m1 a23 * m2 a31) + (m1 a24 * m2 a41)).
	c2 := ((m1 a21 * m2 a12) + (m1 a22 * m2 a22) + 
				(m1 a23 * m2 a32) + (m1 a24 * m2 a42)).
	c3 := ((m1 a21 * m2 a13) + (m1 a22 * m2 a23) + 
				(m1 a23 * m2 a33) + (m1 a24 * m2 a43)).
	c4 := ((m1 a21 * m2 a14) + (m1 a22 * m2 a24) + 
				(m1 a23 * m2 a34) + (m1 a24 * m2 a44)).

	m3 a21: c1; a22: c2; a23: c3; a24: c4.

	c1 := ((m1 a31 * m2 a11) + (m1 a32 * m2 a21) + 
				(m1 a33 * m2 a31) + (m1 a34 * m2 a41)).
	c2 := ((m1 a31 * m2 a12) + (m1 a32 * m2 a22) + 
				(m1 a33 * m2 a32) + (m1 a34 * m2 a42)).
	c3 := ((m1 a31 * m2 a13) + (m1 a32 * m2 a23) + 
				(m1 a33 * m2 a33) + (m1 a34 * m2 a43)).
	c4 := ((m1 a31 * m2 a14) + (m1 a32 * m2 a24) + 
				(m1 a33 * m2 a34) + (m1 a34 * m2 a44)).

	m3 a31: c1; a32: c2; a33: c3; a34: c4.

	c1 := ((m1 a41 * m2 a11) + (m1 a42 * m2 a21) + 
				(m1 a43 * m2 a31) + (m1 a44 * m2 a41)).
	c2 := ((m1 a41 * m2 a12) + (m1 a42 * m2 a22) + 
				(m1 a43 * m2 a32) + (m1 a44 * m2 a42)).
	c3 := ((m1 a41 * m2 a13) + (m1 a42 * m2 a23) + 
				(m1 a43 * m2 a33) + (m1 a44 * m2 a43)).
	c4 := ((m1 a41 * m2 a14) + (m1 a42 * m2 a24) + 
				(m1 a43 * m2 a34) + (m1 a44 * m2 a44)).

	m3 a41: c1; a42: c2; a43: c3; a44: c4.