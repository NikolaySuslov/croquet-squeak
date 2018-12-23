accessing
syncList
	"Return the list used for serializing asynchronous scripts. This list is used for scripts triggering async events that need to be responded to synchronously."
	^syncList ifNil:[syncList := Semaphore new].