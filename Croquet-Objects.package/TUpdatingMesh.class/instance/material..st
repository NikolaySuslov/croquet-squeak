accessing
material: mat

	"Assign my material.    If the incoming material has a texture,
       use that as my texture.  Otherwise, if I already had a texture,
       use my old texture. "

	| txtr |

	"Hang on to the texture of my old material."
	txtr :=  (materialList at:1)texture.
	super material: mat copy.

	"If the new material didn't come with a texture, use the old one."
	(materialList at: 1) texture ifNil: [
		(materialList at: 1)texture: txtr.
	].
	self checkAlpha.