*Islands-Support-description
collectReplicateValues
	"(self future new: Object) future collectReplicateValues"

	| replicateValues replicateID |
	replicateValues := OrderedCollection new.
	replicateID := TObjectID for: self.
	self island register: replicateValues name: replicateID.
	self island signal: #collectReplicateValues withArguments: { self . replicateValues . replicateID copy}.
	^replicateValues