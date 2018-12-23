islands
findContactByPostcard: pc
	| contact |

	contactPoint ifNil:[
		contactPoint := TContactPointWS new.
		contactPoint hostName: self class defaultBroadcaster.
		contactPoint start.
		].
	pc routerAddress ifNil:["indicates that this is a LAN contact"
		"Grab most recent contact"
		pc routerID ifNotNil:["first by ID"
			contact := contactPoint contactsByID at: pc routerID ifAbsent:[nil].
		].
		contact ifNil:["then by name"
			contact := contactPoint contactsByName at: pc routerName ifAbsent:[nil].
		].
		contact ifNil:[^nil]. "still waiting for a contact"

		contact setupContact.
		self addController: contact controller.
		self addIsland: contact controller island postcard: pc.
		^ contact controller island.
	] ifNotNil:[
		"go out and find the contact on the WAN"
	].
	^ nil.