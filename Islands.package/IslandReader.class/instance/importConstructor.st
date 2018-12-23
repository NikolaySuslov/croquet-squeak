importing
importConstructor
	"Export an array"
	| constructor object value |
	constructor := self importNext.
	object := self importNext.
	value := constructor importFromIslandReader: object.
	^ value