searching
printPath: goal
	"Print the reference path to the goal we found"
	| list obj parent key |
	(self isMarked: goal) ifFalse:[
		log cr; cr; nextPutAll: (goal name printString truncateTo: 50), ' : ', goal class name.
		log cr; nextPutAll: '<<no reference path could be found>>'.
		^self].
	list := self buildRawList: goal.

	obj := list removeFirst.
	log cr; cr; nextPutAll: 'root: ', (obj == Smalltalk specialObjectsArray ifTrue:['Smalltalk specialObjects'] ifFalse:[obj name]), ' (', obj class name,')'.
	[list isEmpty] whileFalse:[
		parent := obj.
		obj := list removeFirst.
		key := nil.
		(list size >= 3 and:[parent class includesBehavior: CObject]) ifTrue:[
			((obj == (parent instVarNamed: 'myProperties')) and:[
				(list first == (obj instVarNamed: 'array'))]) ifTrue:[
					key := list second key.
					list removeFirst; removeFirst.
					obj := list removeFirst.
				].
		].
		(parent class includesBehavior: Dictionary) ifTrue:[
			list size >= 2 ifTrue:[
				key := parent keyAtValue: list second ifAbsent: [].
				key ifNotNil:[
					obj := list removeFirst; removeFirst.
				].
			].
		].
		key ifNil:[parent class == obj ifTrue: [key := 'CLASS']].
		key ifNil:[
			1 to: parent class instSize do: [:i | 
				key ifNil:[ (parent instVarAt: i) == obj ifTrue:[
						key := parent class instVarNameForIndex: i.
				]]]].
		key ifNil:[parent class isVariable ifTrue:[
			1 to: parent basicSize do: [:i | 
				key ifNil:[(parent basicAt: i) == obj ifTrue: [
					key := i printString.
				]]]]].
		key ifNil:[key := '???'].
		log cr; nextPutAll: key asString, ': ' , obj checkpointDescription
	].