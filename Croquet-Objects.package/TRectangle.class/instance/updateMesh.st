accessing
updateMesh
	| nverts |

	nverts := (divisions x+1)*(divisions y+1).
	vertexBuffer := Vector3Array ofSize: nverts.
	normalBuffer := Vector3Array ofSize: nverts.
	texCoordBuffer := Vector2Array ofSize: nverts.

	divisions = (1@1) ifTrue:[ self update11.] ifFalse:[
		divisions y > divisions x ifTrue:[self updateY]ifFalse:[self updateX].
	].
	changed := false.

