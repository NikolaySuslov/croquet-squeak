copying
passByProxy: obj
	"Pass the object using a proxy"
	| ref |
	ProxyStats ifNotNil:[ProxyStats add: obj class].
	obj isFarRef 
		ifTrue:[ref := obj]
		ifFalse:[ref := srcIsland asFarRef: obj].
	^ref valueOn: dstIsland