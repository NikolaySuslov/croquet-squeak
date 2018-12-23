as yet unclassified
do: aBlock 

	"should cope better than do: if another thread adds or removes items"
 
	tally = 0 ifTrue: [^ self].
	1 to: array size do:
		[:index |
		| each |
		(each := array at: index ifAbsent: [ ^ self ]) ifNotNil: [aBlock value: each]]