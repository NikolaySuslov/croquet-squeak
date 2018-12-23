importing
importFont
	| family height emphasis |
	family := self importNext.
	height := self importNext.
	emphasis := self importNext.
	^StrikeFont familyName: family size: height emphasized: emphasis