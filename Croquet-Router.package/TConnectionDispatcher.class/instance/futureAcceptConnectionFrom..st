server
futureAcceptConnectionFrom: aSocket
	"Fork it off"
	[
		self log futureAcceptConnectionFrom: aSocket.
		[self acceptConnectionFrom: aSocket]
			on: Error do:[:ex| 
				self logError: ex.
				aSocket destroy.
				ex return.
			]
	] fork.