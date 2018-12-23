registry
compactNameMap: refId
	"Remove everything from nameMap that isn't reachable through globals.
	Guarnteed to break things if participants are doing someting."
	| ourFarRef |

	"We should probably also get rid of TForms that aren't referenced anywhere. Later. -H"

	nameMap := Dictionary new.
	globals do: [:root | root deepRegisterIntoIsland: self].
	ourFarRef := (self asFarRef: self).
	nameMap at: id put: ourFarRef.
	nameMap at: TObjectID nilObjectID put: ourFarRef.
	nameMap at: refId put: ourFarRef.
