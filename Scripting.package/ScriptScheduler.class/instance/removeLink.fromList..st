scheduling
removeLink: aLink fromList: aList
	| newHead |
	newHead := aList.
	aLink prevLink == nil
		ifTrue:[newHead := aLink nextLink]
		ifFalse:[newHead := aList.
				aLink prevLink nextLink: aLink nextLink].
	aLink nextLink == nil
		ifFalse:[aLink nextLink prevLink: aLink prevLink].
	^newHead