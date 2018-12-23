initialize
installModelData
	"Install our model in the current space"
	| costumeAndHead p |
	currentSpace ifNil:[^nil].
	"Allow current space to override user's avatar choice"
	(currentSpace get: #defaultAvatar) ifNotNilDo:[:atarData|
		^self costume: (TIslandCopier new import: atarData to: currentSpace island).
	].
	modelData ifNil:[^nil].
	costumeAndHead := TIslandCopier new import: modelData to: currentSpace island.
	self costume: costumeAndHead future first.
	"This is a little awkward since the head can resolve to nil 
	and we need to handle this properly"
	p := costumeAndHead future second.
	p whenResolved:[self head: p value].
