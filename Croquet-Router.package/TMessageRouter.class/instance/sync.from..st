actions
sync: data from: aClient
	"aClient wants to sync, e.g., receive a copy of the replicated state"
	| serverList any resID snapshot requestorFacet replyFacet |
	"Get the response facet"
	requestorFacet := data copyFrom: 1 to: 16.
	resID := data copyFrom: 17 to: data size.


	"first see if I can provide the snapshot myself"
	(self isProxy and: [upstream isServer]) ifTrue: [
		self halt. "untested code path"
		"code adapted from TRemoteController >> serve:from:"
		snapshot := upstream snapshotOrResourceAt: resID.
		snapshot ifNil:[^nil].

		"send snapshot back to client. Fake an incoming data packet"
		replyFacet := TObjectID new.
		aClient syncFacets at: replyFacet put: requestorFacet.
		aClient syncReply: snapshot from: nil facet: replyFacet.

		"and send a dummy message so that the other guy can play catch up"
		^ upstream island future yourself].


	"next see if any of my children can serve the request"
	serverList := self serversFor: aClient.
	(self serversFor: aClient) ifNotEmpty: [
		"choose a server at random for now"
		any := serverList atRandom.
		self logMessage: 'SYNC: ', (self printHex: resID), ' --> ', (self printClient: any).

		"and invoke the sync facet on the server"
		replyFacet := any addMessageFacet: (MessageSend receiver: aClient selector: #syncReply:from:facet:).
		aClient syncFacets at: replyFacet put: requestorFacet.
		^ any outQueue nextPut: (TDatagram facet: any serveFacet data: replyFacet, resID)].


	"finally, try forwarding the request up to my parent"
	self isProxy ifTrue: [
		"code adapted from TRemoteController >> sync:"
		replyFacet := upstream addMessageFacet: (MessageSend
			receiver: aClient
			selector: #syncReply:from:facet:).
		aClient syncFacets at: replyFacet put: requestorFacet.
		^ upstream connection outQueue nextPut: (TDatagram
			facet: (upstream facets at: #sync)
			data: replyFacet, resID)].


	"if we reach here, we don't know where a server is. Send back an empty snapshot"
	self logMessage: 'SYNC: NO SERVERS FOR ', (self printClient: aClient).
	clients do:[:each| self logMessage: '		', (self printClient: each)].
	replyFacet := TObjectID new.
	aClient syncFacets at: replyFacet put: requestorFacet.
	^ aClient syncReply: ByteArray new from: nil facet: replyFacet