as yet unclassified
name: nme value: val
	"Create a LinkList node with name value pairs"

	| node |
	node := self new.
	node name: nme.
	node value: val.
	^node.