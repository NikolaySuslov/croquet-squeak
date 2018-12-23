*Scripting-Extensions
wait: timeOut
	"Wait for the given number of seconds"
	timeOut > 0 ifTrue:[(Delay forMilliseconds: (timeOut * 1000) asInteger) wait].