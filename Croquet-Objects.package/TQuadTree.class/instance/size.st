accessing
size

	| ttl |
	ttl := 0.
	ttl := spheres ifNil:[0] ifNotNil:[spheres size].
	ttl := ttl + (qtTL ifNil:[0] ifNotNil:[qtTL size]).
	ttl := ttl + (qtTR ifNil:[0] ifNotNil:[qtTR size]).
	ttl := ttl + (qtBL ifNil:[0] ifNotNil:[qtBL size]).
	ttl := ttl + (qtBR ifNil:[0] ifNotNil:[qtBR size]).

	^ ttl.