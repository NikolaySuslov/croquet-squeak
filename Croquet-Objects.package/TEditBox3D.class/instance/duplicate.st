actions
duplicate

	| copy |
	copy := contents copy.
	copy localTransform: Matrix4x4 identity.
	copy translation: (copy translation + (2@2@2)).
	contents addChild: copy.
	TEditBox3D new initializeWithContents: copy editPortal: editPortal.

