events
delete

	super delete.
	editPortal ifNotNil:[editPortal clearSelection.].