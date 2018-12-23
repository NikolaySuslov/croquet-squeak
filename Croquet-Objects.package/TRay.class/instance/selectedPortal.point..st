accessing
selectedPortal: sp point: pos

	sp ifNil:[selection portal: nil. selection portalPoint:nil. ^ self].
	selection portal ifNil:[selection portal: sp. selection portalPoint: pos.].