parsing
spell: misspelled in: aDirectory
	"Correct spelling for a potentially mis-spelled file in aDirectory"
	| corrected |
	corrected := aDirectory fileNames detect:[:any| any sameAs: misspelled].
	^aDirectory fullNameFor: corrected