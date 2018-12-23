parse
parseOld: string

	| tloc nloc tn name tree |
	tree := nil. "just to show this is accidental"
	tloc := string indexOfAnyOf: DelimSet1 startingAt: stringLoc ifAbsent:[string size+1].
	stringLoc := tloc+1.
" ---- Is this a label?  If not, then we are poorly formed. Bail as best you can."
	(string at: tloc) = $* ifTrue:[
		tree := OrderedCollection new.

" ---- Loop Here ---- "
		[stringLoc < string size] whileTrue:[

" ---- Find the field name or end of block or end of file."
			tloc := string indexOfAnyOf: DelimSet2 startingAt: stringLoc ifAbsent:[string size+1].
			(string at: tloc) = $} ifTrue:[ stringLoc := tloc + 1. ^tree. ].
			tloc >= string size ifTrue:[^tree.].
			(string at: tloc) = ${ ifTrue:[^tree.].
			tn := string copyFrom: stringLoc to: (tloc-1).
			name := 'T'. "Because this is Tea and because some field start with numbers."
			(tn findTokens: '_')do:[ :tkn | name := name, (tkn asLowercase capitalized)].
			name := name asSymbol.
			tree add: name.
" ---- Find the data."
			stringLoc := tloc+1.
			tloc := string indexOfAnyOf: DelimSet1 startingAt: stringLoc ifAbsent:[string size+1].

" ---- End of file."
			tloc > string size ifTrue:[ 
				tree add: (string copyFrom:stringLoc to: (tloc-1)). 
				stringLoc := tloc. 
				^tree.].

" ---- Found a new name or end of block- everything in between the last one and this must be useful."
			((string at: tloc) = $* or:[(string at: tloc)= $}])ifTrue:[ 
				nloc := string indexOf: Character cr startingAt: stringLoc ifAbsent:[string size+1].
				nloc > tloc ifTrue:[nloc := tloc].
				stringLoc <= (nloc-1) ifTrue:[
					tree add: (string copyFrom: stringLoc to: (nloc-1)).]
				ifFalse: [
					tree add:''].
				(string at: tloc)=$} ifTrue:[stringLoc := tloc. ^tree].
				stringLoc := tloc+1.
				].

" ---- Found a block - recurse."
			(string at: tloc) = ${ ifTrue: [
				stringLoc := tloc+1. 
				tree add: (self parseOld: string).
	" ---- Find the next name."
				stringLoc := string indexOfAnyOf: DelimSet3 startingAt: stringLoc+1 ifAbsent:[string size+1].
				stringLoc > string size ifTrue:[^tree].
				(string at: stringLoc) = $} ifTrue:[stringLoc := stringLoc+1. ^tree ].
				stringLoc := stringLoc+1.
				].
			].
		].
	^tree.

