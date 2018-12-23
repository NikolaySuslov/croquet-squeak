An emitter that emits to a remote host (or several) using the syslog protocol in UDP.
The facility is set by number, default is local0, probably just fine.

You may want to set the hostName to something different than localhost.

- Make sure your syslog host (default is localhost) is enabled to listen on port 514.

Test this by:

	SLLog addSyslog.  "Adds a syslog sender emitter to localhost by default"
	SLLog info: 'Testing syslog'