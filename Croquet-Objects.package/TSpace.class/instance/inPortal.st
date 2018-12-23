accessing
inPortal

" returns a portal s.t. the space itself is the viewPoint. This is useful for fixed camera position portals."
	| portal |
	portal := TPortal new.
	portal postcardLink: self postcard.
	^ portal.
