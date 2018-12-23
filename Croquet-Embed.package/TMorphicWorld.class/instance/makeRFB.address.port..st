initialize
makeRFB: passwordString address: addressString port: port
	| client sysWindow |
	client := XrfbClient stickyNew: 16.
	client address: addressString port: port password: passwordString.
 	sysWindow := client systemWindow.
	self makeWorld: sysWindow.
	sysWindow bounds: (Rectangle origin: 0@0 "-20@-20" corner: extent "+ (20@40)").  "Yuck"
