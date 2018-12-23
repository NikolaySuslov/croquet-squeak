scheduling
addLink: link toList: aList
	link nextLink: aList.
	aList ifNotNil:[aList prevLink: link].
	^link