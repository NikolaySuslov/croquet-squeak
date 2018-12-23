accessing
divisions: div

	div isPoint ifTrue:[divisions := div max:(1@1).] ifFalse:[divisions := div@div max:(1@1)].
