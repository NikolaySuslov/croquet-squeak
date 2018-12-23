plugins
eitherPlugin: pluginName
	"see if the plugin with the given name is present as a plugin"
	| pluginString theMethod spec result |
	"try loading the plugin"
	theMethod := self class lookupSelector: #tryNamedPrimitive.
	self assert: theMethod notNil.
	theMethod ifNil:[^self].
	spec := theMethod literalAt: 1.
	spec at: 1 put: pluginName asSymbol.
	spec at: 2 put: #''.
	spec at: 3 put: 0.
	spec at: 4 put: 0.
	theMethod flushCache.
	result := self tryNamedPrimitive.
	self assert: (result == ContextPart primitiveFailToken).

	pluginString := Smalltalk listLoadedModules
		detect:[:any| any beginsWith: pluginName,' ']
		ifNone:[nil].
	self assert: pluginString notNil.