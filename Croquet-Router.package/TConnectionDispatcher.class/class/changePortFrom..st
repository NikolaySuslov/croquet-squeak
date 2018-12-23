ui
changePortFrom: aButton
	| port |
	port := FillInTheBlank request: 'Enter port number' initialAnswer: Port printString.
	port isEmptyOrNil ifTrue:[^nil].
	Port := Number readFrom: port.
	aButton label: 'Port: ', Port printString.