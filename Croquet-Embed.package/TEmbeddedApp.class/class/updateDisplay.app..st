utilities
updateDisplay: displayTForm app: anApp
	"This method is to decouple embedded apps from dealing with TFormManager directly"
	^TFormManager default substituteForm: displayTForm