accessing
portalClip: pc

"This is an additional clip plane defined by a portal. Objects on the near side of the portal need to be clipped away as well. This is a 4x4 transform."

	portalClip := pc.
	portalClip ifNotNil:[
		portalPlane := (Vector3 x: portalClip a13  y:portalClip a23  z: portalClip a33) negated.].
