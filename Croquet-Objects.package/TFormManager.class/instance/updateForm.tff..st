loader process
updateForm: aTForm tff: tff
	mutex critical:[
		"The following is written so that TForms that are substituted via #substituteForm: 
		will not be overwritten here if they have not been found anywhere"
		textureDictionary at: tff sha ifAbsentPut:[aTForm].
		findList removeKey: tff sha.
		sortedFindList remove: tff.
		aTForm ifNotNil:[updateList add: aTForm].
	].