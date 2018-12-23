as yet unclassified
makeLights: space

	| light |

"warm light in northwest corner."
	light := TLight new.
	light ambientColor: #(0.3 0.4 0.5 0.6).
	light diffuseColor: #(0.48 0.35 0.4 0.6).
	light specularColor: #(0.3 0.23 0.2 0.5).
	light rotationAroundY: -130.
	light addRotationAroundX: 120.
	space addChild: light.

"cool light diagonally opposite."
	light := TLight new.
	light ambientColor: #(0.1 0.1 0.1 0.1).
	light diffuseColor: #(0.4 0.35 0.48 0.6).
	light specularColor: #(0.2 0.23 0.3 0.5).
	light rotationAroundY: 132.
	light addRotationAroundX: 120.
	space addChild: light.

" fainter green light in third corner."
	light := TLight new.
	light ambientColor: #(0.1 0.1 0.1 0.1).
	light diffuseColor: #(0.1 0.23 0.1 0.4).
	light specularColor: #(0.3 0.2 0.3 0.3).
	light rotationAroundY: 42.
	light addRotationAroundX: 120.
	space addChild: light.

"and another opposite it"
	light := TLight new.
	light ambientColor: #(0.1 0.1 0.1 0.1).
	light diffuseColor: #(0.1 0.23 0.1 0.4).
	light specularColor: #(0.4 0.3 0.2 0.2).
	light rotationAroundY: -42.
	light addRotationAroundX: 120.
	space addChild: light.
