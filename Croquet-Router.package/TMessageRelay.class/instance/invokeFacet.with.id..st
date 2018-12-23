reader
invokeFacet: msg with: data id: id
	"Invoke the given facet"
	| arguments |
	arguments := {data. self. id shallowCopy} copyFrom: 1 to: msg selector numArgs.
	eventQueue nextPut: (msg shallowCopy arguments: arguments)