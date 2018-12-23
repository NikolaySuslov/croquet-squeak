picking
pointerPickTree: frame excluding: subframe

	| |

	"Do a pointerPickTree search, treating subframe and its subtree as invisible."

	[ 	excludeFrame := subframe.
		^ self pointerPickTree: frame
	] ensure: [
		excludeFrame := nil.
	].
