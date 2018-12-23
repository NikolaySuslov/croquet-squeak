initialize
takeInitialPosition

	"Move the avatar to its containing space's initialAvatarTranslation 
	and initialAvatarYaw. if either or both are defined."

	| aSpace trans yaw |

	aSpace := self parent.
	trans := aSpace initialAvatarTranslation: self.
	trans ifNotNil: [
		self translation: trans.
	].

	yaw := aSpace initialAvatarYaw: self.
	yaw ifNotNil: [
		self yaw: yaw.
	].