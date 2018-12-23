initialize
unregisterApp
	"Unregister the embedded app"
	| apps |
	apps := self island at: #embeddedApps ifAbsent:[#()].
	self island at: #embeddedApps put: (apps copyWithout: self).
