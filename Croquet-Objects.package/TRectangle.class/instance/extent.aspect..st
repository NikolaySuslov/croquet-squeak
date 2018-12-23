accessing
extent: bounds aspect: ratio

	"Fit me within the given extent bounds, respecting the aspect ratio."

	| bh bw |

	(bounds x = 0) ifTrue: [
		bh := 0.
		bw := 0.
	] ifFalse: [
		(ratio > (bounds y / bounds x)) ifTrue: [
			bh := bounds y.
			bw := bounds y / ratio.
		] ifFalse: [
			bw := bounds x.
			bh := bounds x * ratio.
		].
	].

	self aspect: ratio.
	extent := bw@bh.
	self boundsChanged.

