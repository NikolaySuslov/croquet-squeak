enumerating
do: aBlock
	"Overridden to store the (possibly) modified argument back"
	| obj |
	1 to: self size do:[:index|
		obj := self at: index.
		aBlock value: obj.
		self at: index put: obj].