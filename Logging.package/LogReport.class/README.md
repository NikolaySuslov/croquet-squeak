I am a convenience class for dumping the state of an object to the log. My instances know how to write useful, formatted information about an object and its class to the log. See the methods in my public category for what I can dump. To get an instance of me:

self log report: anObject	"a reporter on any object"
self log my					"a reporter on self"
self log it					"a reporter on self"

to dump the instance variables of self to the log:
self log my vars.
self log my slots.
self log my instance.

to dump the class variables of self:
self log my classVars.

to dump all the variables of self:
self log my all.