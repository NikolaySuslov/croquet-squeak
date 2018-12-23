reader
errorNoSuchFacet: fid
	"No facet with the given id exists. Raise an error, close the connection whatever."
	self error: 'No such facet: ', fid printString.
