parse
makeGroup: tree

	| fieldName tframe |

	tframe := TGroup new.

	tree linksDo:[ :node |  "jhk altered to linked list"
		fieldName := node name.
		fieldName = #THelperobject ifTrue:[
			tframe objectName: (self makeHelperObject: node value).
			tframe localTransform: transform.
			].
		fieldName = #TGroup ifTrue:[
			tframe addChild: (self makeGroup: node value).
			].
		fieldName = #TGeomobject ifTrue:[
			tframe addChild: (self makeGeometry: node value).
			].
		].
	^ tframe.
		