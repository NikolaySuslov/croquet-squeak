sanity
testNoLooseSystemCategories
	"Ensure we have no loose system categories around"
	SystemOrganization categories do:[:cat|
		self assert: (self isPackageCategoryCovered: cat).
	].