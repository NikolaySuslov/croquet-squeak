accessing
substituteForm: aTForm
	"Substitute the given TForm in the form manager"
	mutex critical:[
		textureDictionary at: aTForm sha put: aTForm.
		updateList add: aTForm.
	].