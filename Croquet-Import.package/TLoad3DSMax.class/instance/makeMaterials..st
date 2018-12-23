parse
makeMaterials: tree

	| count cnter fieldName |

	count := 0.
	tree linksDo:[ :node |
		fieldName := node name.

		count=0 
			ifTrue: 
				[(fieldName = #TMaterialCount) ifTrue:[ count := (node value) asNumber].		
				count <= 0 ifTrue:[^self].
				materialList := OrderedCollection new.
				cnter := count.
				]
			ifFalse:[
				fieldName = #TMaterial ifTrue:[ 
					materialList add: (self makeMaterial: (node value)).].
					cnter := cnter -1.
					cnter<=0 ifTrue:[^self]
				].
		].