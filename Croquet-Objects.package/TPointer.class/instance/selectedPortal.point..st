accessing
selectedPortal: sp point: pos

	sp ifNil:[selection portal: nil. selection portalPoint:nil. ^ self].
	selection portal ifNil:[selection portal: sp objectID. selection portalPoint: pos.].