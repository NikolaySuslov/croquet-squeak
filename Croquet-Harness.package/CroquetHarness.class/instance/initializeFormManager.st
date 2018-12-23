initialize
initializeFormManager
	"Initialize the form manager. Subclasses may override this method to provide other form managers."
	TFormManager default destroy.
	TFormManager default: nil.
	^TFormManager default.
