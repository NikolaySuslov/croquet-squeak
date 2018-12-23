constructing
addItemSpec: itemSpec target: aTarget
	"Add an item.  The first parameter, itemSpec, is 
		*  either... the symbol $-, to request a separator
		*  or...an array of two or three items:
				(1)  item label
				(2)  either:
						item selector (what will be sent to the target)
					  or
						an array (defining a submenu)
				(3)  optional - balloon-help string"

	| itemName itemValue item |
	itemSpec == #- ifTrue:[^self addSeparator].
	itemName := itemSpec first.
	itemValue := itemSpec second.
	item := self addItem: itemName.
	(itemValue isMemberOf: Array) ifTrue:[
		item subMenu: (TMenuFrame new addList: itemValue target: aTarget).
	] ifFalse:[
		item action: (TMenuAction receiver: aTarget selector: itemValue).
	].
	itemSpec size > 2
		ifTrue: [item helpText: itemSpec third].

	^item