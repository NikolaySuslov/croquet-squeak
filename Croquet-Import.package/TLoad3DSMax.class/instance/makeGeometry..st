parse
makeGeometry: tree
	"handle the geometry fields"
	| tframe  fieldName start end children isMesh mesh |
	isMesh := false.
	children := OrderedCollection new.
	tree linksDo:[ :node |   "jhk altered to linked list for performance"
		fieldName := node name.
		fieldName = #THelperobject ifTrue:[
			tframe := TGroup new.
			tframe objectName: (self makeHelperObject: node value).
			tframe localTransform: transform.
			].
		fieldName = #TNodeName ifTrue:[ 
			start := (node value) findDelimiters: '"' startingAt: 1.
			end := (node value) findDelimiters: '"' startingAt: start+1.
			self objectName: ((node value) copyFrom: start+1 to: end-1).
			].
		fieldName = #TNodeTm ifTrue:[ self localTransform: (self makeTransform: node value).].
		fieldName = #TMesh ifTrue:[ 
			self makeMesh: node value.
			vertices size > 0 ifTrue:[isMesh := true.].
			].
		fieldName = #TMaterialRef ifTrue:[ materialRef := self makeNumber: node value.]. 
		].

	isMesh ifTrue:[ mesh := self reconstruct.] 
			ifFalse:[ mesh := TGroup new.
					mesh objectName: (self objectName).
					mesh localTransform: self localTransform.
                       ].
	children do:[ :c | mesh addChild: c].
	^ mesh.
		