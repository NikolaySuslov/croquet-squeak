udp listener
runUdpListener

	wsListener := WebClient webSocketTo: self hostName "'http://localhost:8080/broadcast'".
	wsListener onMessage:[:data| 
		
		|decode cc|

		decode := WebUtils jsonDecode: data readStream.
		
					"Transcript show: 'get contact - ', decode; cr."
		
					cc := TContact new fromData: decode.
					contactsByName at: cc name ifAbsentPut:[ cc ].
					contactsByID at: cc id ifAbsentPut:[ cc ].
		].
	
		wsListener run

