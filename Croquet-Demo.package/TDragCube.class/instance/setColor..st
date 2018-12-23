accessing
setColor: bc

	| mat |

	mat := TMaterial new.
	mat color: bc.
	self material: mat.
	baseColor := bc.
