tests-simple
testImplicitIsland
	| island obj |
	island := Island named: 'test'.
	Smalltalk at: #CWindow ifPresent:[:cls|
		obj := island new: cls.
		self assert: obj island == island.
		[
		self assert: obj costume island == island.
		self assert: obj costume frontPage island == island.
		"...etc..."
		] on: CUnsynchronizedModification do:[:ex| ex resume].
	].
	Smalltalk at: #SystemWindow ifPresent:[:cls|
		obj := island new: cls.
		self assert: obj island == island.
		self assert: obj firstSubmorph island == island.
		"... etc ..."
	].