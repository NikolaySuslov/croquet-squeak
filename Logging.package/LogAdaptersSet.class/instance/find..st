as yet unclassified
find: aClass
	 
	^ self detect: [ :ea | ea class = aClass ] ifNone: [ nil ]