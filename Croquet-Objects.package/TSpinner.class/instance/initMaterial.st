initialize
initMaterial

	| |
	matNorm := TMaterial new.
	matNorm ambientColor: #(0.5 0.7 0.7 0.5).
	matNorm diffuseColor: #(0.5 0.7 0.7 0.5).

	matOver := TMaterial new.
	matOver ambientColor: #(0.2 0.5 1.0 0.8).
	matOver diffuseColor: #(0.2 0.5 1.0 0.8).

	matDown := TMaterial new.
	matDown ambientColor: #(0.2 1.0 0.5 1.0).
	matDown diffuseColor: #(0.2 1.0 0.5 1.0).

