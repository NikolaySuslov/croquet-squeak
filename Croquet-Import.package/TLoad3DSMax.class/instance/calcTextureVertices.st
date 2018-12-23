convert
calcTextureVertices

" This is a somewhat naive fix to the texture transform issue. Be aware that I am not checking for shared texture coordinates. This means that if two textures share the same uv coordinate before the transform but not after, we have a problem. I don't know what 3DS Max does, so I will deal with it when I find the problem."
	| tv ml counter tv2 fvi avi ai found oc |

	ml := materialList at: 1+ materialRef.
	ml subMaterialList ifNotNil:[ ml := ml subMaterialList.] 
	ifNil:[
		oc := OrderedCollection new.
		oc add: ml.
		ml := oc.
		].
	tv := Vector2Array ofSize: tfaces size.
	1 to: tfaces size do:[ :i |
		counter := 1+(i-1//3).
		
		tv at: i put: (self textureTransform: (tvertices at: 1+(tfaces at: i)) 
			material: (ml at: 1+((matIndex at: counter)\\ml size))).
		].

	tv2 := OrderedCollection ofSize: tvertices size.
	ai := OrderedCollection ofSize: tvertices size.
	1 to: tfaces size do:[ :i | 
		found := false.
		fvi := 1+ (tfaces at: i).
		avi := fvi.
		[ found ] whileFalse:[
			"Anything already in this slot?"
			(tv2 at: avi) ifNil:[
				tv2 at: avi put: (tv at:i).
				tfaces at: i put: avi -1.
				found := true.].
			"Is it the same thing we already have?"
			found ifFalse:[
				(tv2 at: avi) = ( tv at: i) ifTrue:[
					tfaces at: i put: avi-1.
					found := true.].].
			"There is something already there, but it is the wrong thing, we need an alias"
			found ifFalse:[
				(ai at: avi) ifNil:[
					ai add: nil.
					tv2 add: (tv at: i).
					tfaces at: i put: (tv2 size -1). "index of new element - 1"
					ai at: avi put: tv2 size. "pointer to new element"
					found := true.] 
				"The alias was full, check the next alias."
				ifNotNil:[ avi := ai at: avi.].].].].

	" Convert array."
	tvertices := Vector2Array ofSize: tv2 size.
	1 to: tv2 size do:[ :i | (tv2 at: i) ifNotNil:[ tvertices at: i put: (tv2 at: i).].].
				