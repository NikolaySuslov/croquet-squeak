driving
goToSpaceHome
	"Go to the home position of the space we're in."

	| home |
	home := self root homeTransform: self.
	home ifNotNil: [
		self goto: home count: 16 sticky: false.
	].