initialize
calcMemUsed

	memUsed := form extent area*4.
	bMipmap ifTrue:[memUsed := memUsed + (memUsed//3)].