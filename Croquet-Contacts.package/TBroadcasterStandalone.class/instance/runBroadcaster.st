websocket
runBroadcaster

	webserver := WebServer new.
	webserver listenOn: 8080 "interface: (NetNameResolver addressFromString: '10.0.1.6')".

	webserver addService: '/' action:[:req|
		req send200Response: '<div>Croquet TContactPoint broadcaster</div>' contentType: 'text/html'.
	].
	
	webserver addService: '/broadcast' action:[:req |
		|ws|	
		"Implements the WebSocket broadcaster"
		ws := req asWebSocket.
		ws timeout: 45.
		Transcript cr; show: 'New ', ws.

		ws onMessage:[:data|
			
			mutex critical:[sockets do:[:s| s send: data]].
		].
		ws onClose:[
			Transcript cr; show: 'Closing ', ws.
			mutex critical:[sockets remove: ws ifAbsent:[]].
		].
		ws onError:[:ex|

			Transcript cr; show: ws.
			Transcript cr; show: ex description.
			Transcript cr; show: ex signalerContext longStack.
		].
	
		mutex critical:[sockets add: ws].
		ws run
		
]