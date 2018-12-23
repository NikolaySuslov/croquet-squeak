initialize
login: userName password: passHash
	"Perform a login operation. For the example router this is meaningless; all we need to do is to invoke the login facet"
	| facet p |
	status := #authenticating.
	p := loginPromise := TPromise new.

	"Create the response to invoke"
	self revokeFacetCalled: #recvFacets.
	facet := self addFacetCalled: #recvFacets sending: #recvFacets:from: .

	connection outQueue nextPut: (TDatagram facet: TExampleController loginFacet data: facet).
	^p