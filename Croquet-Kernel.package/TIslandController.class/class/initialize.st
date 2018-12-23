accessing
initialize
	"TRemoteController initialize"
	AccessProtect := TMutex new.
	Registry := WeakValueDictionary new.