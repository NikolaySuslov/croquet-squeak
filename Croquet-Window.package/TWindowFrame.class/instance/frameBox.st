accessing
frameBox

	| extent2 |
	extent2 := extent/2.0.
	^TBox origin: (extent2 x + radius) negated @ (extent2 y + radius) negated @ radius negated corner: (extent2 x + radius) @ (extent2 y + radius) @ radius.