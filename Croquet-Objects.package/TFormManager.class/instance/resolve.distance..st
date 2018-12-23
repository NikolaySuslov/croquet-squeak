accessing
resolve: thumb distance: dist
	" This returns the real TForm, if it is available. Otherwise, it adds the location info of the TForm to the findList and sortedFindList so that it can be loaded later. There are two search lists, the findList and the sortedFindList. The findList is a simple Dictionary used to determine if we are currently searching for this TForm. The sortedFindList is a SortedCollection sorting on the distance field of the TFormFind. If the thumb sha is not found in the findList then a new TFormFind is created and added to the findList and sortedFindList. If it already exists, then we compare the current distance to the previous TForm distance, and if the current is shorter, we reset this value in the TFormFind and force the sortedFindList to reSort, which will raise the probability that this object gets loaded sooner. If the value of the texture in the textureDictionary is nil, this means that we were unable to find the real texture, so just return the thumb.
DAS"

	| tff tf |
	tf := textureDictionary at: thumb sha ifAbsent:[nil].
	tf ifNotNil:[^tf].
	tff := findList at: thumb sha ifAbsent:[nil].
	tff ifNil:["Create new TFormFind for this texture"
		tff := TFormFind new initialize: thumb distance: dist.
		tff controllerID: Processor activeIsland controllerID.
		mutex critical:[
			findList at: tff sha put: tff.
			sortedFindList add: tff.
			loaderSema signal]].
	tff distance > dist ifTrue:["this texture is not closer to us, increase priority"
		mutex critical:[
			tff distance: dist.
			sortedFindList reSort.
		].
	].
	^thumb