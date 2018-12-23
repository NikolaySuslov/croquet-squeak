actions
serversFor: aClient
"Answer a list of candidate servers that could answer a reply from aClient"

	| serverList |
	"Find a server, e.g., a client with a serve facet"
	serverList := clients select:[:each| each serveFacet notNil].
	"But exclude the client itself - since he asked for the sync he doesn't have it."
	^ serverList copyWithout: aClient.
