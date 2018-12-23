class initialization
initialize
	"TFarRef initialize"
	AllFarRefs := TFarRefRegistry new.
	AllFarRefs addAll: self allSubInstances.