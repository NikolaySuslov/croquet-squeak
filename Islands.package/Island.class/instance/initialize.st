initialize
initialize
	exports := FarRefMap new.
	exports island: self.
	globals := IdentityDictionary new.

"@@@@ FIXME: This needs to go out of here and be moved to TIsland since it has a dependency on the RC4 cypher. After the unification of Island/TIsland this should just go away."
	self initializeRandomStream