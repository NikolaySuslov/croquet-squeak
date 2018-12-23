private
privateLoadFrom: srcObject
	"Load the receiver from the given source object."
	self error:'Cannot load a ', srcObject class name,' into a ', self class name.