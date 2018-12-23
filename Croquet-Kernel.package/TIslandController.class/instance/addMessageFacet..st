facets
addMessageFacet: aFacet
	"Add the given message send as a facet under the provided 128 bit id"
	| fid msgSend |
	aFacet isSymbol 
		ifTrue:[msgSend := self messageFacetNamed: aFacet]
		ifFalse:[msgSend := aFacet].
	fid := TObjectID for: 'Facet'.
	facets at: fid put: msgSend.
	^fid