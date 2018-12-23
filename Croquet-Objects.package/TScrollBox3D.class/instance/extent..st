accessing
extent: ext

	contents ifNotNil:[ 
		contents extent: ext.
		box := self getBox: contents.].
	changed := true.