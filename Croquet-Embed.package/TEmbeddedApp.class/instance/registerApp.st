initialize
registerApp
	"Register the embedded app. Note: Only send #registerApp once receiver is fully initialized since a client will want to know name/extent/data."
	| apps |
	apps := self island at: #embeddedApps ifAbsent:[#()].
	self island at: #embeddedApps put: (apps copyWith: self).
	self island signal: #updateEmbeddedApps with: self island.