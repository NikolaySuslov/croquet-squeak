library
mouseUpSketch: evt from: holder
	| cc |
	cc := (Color r: 0.7 g: 0.7 b: 0.4).
	holder color: (Color white mixed: 0.7 with: cc).
	editor repaint: holder firstSubmorph form.