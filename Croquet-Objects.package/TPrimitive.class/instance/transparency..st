accessing
transparency: trans
	super transparency: trans.
	material ifNotNil:[material transparency: trans].
