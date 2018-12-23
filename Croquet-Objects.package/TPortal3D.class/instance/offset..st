accessing
offset: os

	| offset |
	offset := transform orientation orthoNormInverse localPointToGlobal:os negated.
	transform translation: offset.
