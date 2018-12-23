private
validateRoots: roots
	"Validate the roots to be written out. This is a good thing to do since some objects are unique (nil, true, false) but having them as roots for an island would *force* these to be duplicated which causes major problems down the road. Subclasses may override this method to do more or less extensive checks."
	roots do:[:obj|
		(IslandArgumentCopier isPassByIdentity: obj)
			ifTrue:[self error:'Cannot have passByIdentity: roots'].
	].
