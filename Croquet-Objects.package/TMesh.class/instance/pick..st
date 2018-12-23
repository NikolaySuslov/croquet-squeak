accessing
pick: pointer

" We are here because we already picked the top level boundSphere, so we know that is true. Now what we need to test against the hierarchy, which will return a list of faces if true - otherwise, it will return nil."

	^ boundSphere pickChildren: pointer.