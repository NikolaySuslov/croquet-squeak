facets
revokeFacetCalled: symbolName

	| nameFacet |
	nameFacet := facets at: symbolName ifAbsent:[nil].
	nameFacet ifNotNil:[self revokeMessageFacet: nameFacet].
