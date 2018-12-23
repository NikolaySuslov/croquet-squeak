as yet unclassified
invokeFacet: msg with: data
	"Invoke the given facet"
	eventQueue nextPut:(msg shallowCopy arguments: {data. self}).