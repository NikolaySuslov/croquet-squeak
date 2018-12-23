miscellaneous
md5Hash: arg
	| hash large |
	hash := TCryptoRandom md5HashMessage: arg.
	large := LargePositiveInteger new: 16.
	large replaceFrom: 1 to: 16 with: hash startingAt: 1.
	^large normalize