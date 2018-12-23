double dispatching
productFromMatrix4x4: matrix
	"Multiply a 4x4 matrix with the receiver."
	| result |
	result := self class new.
	result a11: ((matrix a11 * self a11) + (matrix a12 * self a21) + 
				(matrix a13 * self a31) + (matrix a14 * self a41)).
	result a12: ((matrix a11 * self a12) + (matrix a12 * self a22) + 
				(matrix a13 * self a32) + (matrix a14 * self a42)).
	result a13: ((matrix a11 * self a13) + (matrix a12 * self a23) + 
				(matrix a13 * self a33) + (matrix a14 * self a43)).
	result a14: ((matrix a11 * self a14) + (matrix a12 * self a24) + 
				(matrix a13 * self a34) + (matrix a14 * self a44)).

	result a21: ((matrix a21 * self a11) + (matrix a22 * self a21) + 
				(matrix a23 * self a31) + (matrix a24 * self a41)).
	result a22: ((matrix a21 * self a12) + (matrix a22 * self a22) + 
				(matrix a23 * self a32) + (matrix a24 * self a42)).
	result a23: ((matrix a21 * self a13) + (matrix a22 * self a23) + 
				(matrix a23 * self a33) + (matrix a24 * self a43)).
	result a24: ((matrix a21 * self a14) + (matrix a22 * self a24) + 
				(matrix a23 * self a34) + (matrix a24 * self a44)).

	result a31: ((matrix a31 * self a11) + (matrix a32 * self a21) + 
				(matrix a33 * self a31) + (matrix a34 * self a41)).
	result a32: ((matrix a31 * self a12) + (matrix a32 * self a22) + 
				(matrix a33 * self a32) + (matrix a34 * self a42)).
	result a33: ((matrix a31 * self a13) + (matrix a32 * self a23) + 
				(matrix a33 * self a33) + (matrix a34 * self a43)).
	result a34: ((matrix a31 * self a14) + (matrix a32 * self a24) + 
				(matrix a33 * self a34) + (matrix a34 * self a44)).

	result a41: ((matrix a41 * self a11) + (matrix a42 * self a21) + 
				(matrix a43 * self a31) + (matrix a44 * self a41)).
	result a42: ((matrix a41 * self a12) + (matrix a42 * self a22) + 
				(matrix a43 * self a32) + (matrix a44 * self a42)).
	result a43: ((matrix a41 * self a13) + (matrix a42 * self a23) + 
				(matrix a43 * self a33) + (matrix a44 * self a43)).
	result a44: ((matrix a41 * self a14) + (matrix a42 * self a24) + 
				(matrix a43 * self a34) + (matrix a44 * self a44)).

	^result