initialize
rebuild

	self removeAllMorphs.
	"self addARow: { (StringMorph contents:'Please enter your credentials') lock }."
	self addARow: {
		(StringMorph contents: 'User name' font: self myFont) lock.
	}.
	(self addARow: {
		(theNameMorph := TextMorph new
			beAllFont: self myFont;
			crAction: (MessageSend receiver: self selector: #doOK);
			extent: 236@20;
			contentsWrapped: '<user name>';
			setBalloonText: 'Enter your name'
			).
	}) color: Color white; borderColor: Color black; borderWidth: 1.

	self addARow: {
		(StringMorph contents: 'Password:' font: self myFont) lock.
	}.
	(self addARow: {
		(thePasswordMorph := TextMorph new
			beAllFont: (StrikeFont passwordFontSize: 16);
			crAction: (MessageSend receiver: self selector: #doOK);
			extent: 236@20;
			contentsWrapped: '<password>';
			setBalloonText: 'Enter your password'
			).
	}) color: Color white; borderColor: Color black; borderWidth: 1.

	self addARow: {
		self okButton.
		self cancelButton.
	}.
	"self addARow: { (StringMorph contents:'') lock }."
