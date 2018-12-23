initialize
buildAlphaSlider
	| slider |
	slider := SimpleSliderMorph new.
	slider extent: 100@10.
	slider target: self.
	slider actionSelector: #alpha:.
	^slider