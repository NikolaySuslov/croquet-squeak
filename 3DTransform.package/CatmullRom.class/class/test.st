instance creation
test
	
	| points pen cr |
"This generates a nice shape on the screen. "
	points := {0@0. 0@100. 100@100. 100@200. 200@200. 200@300. 300@300. 300@200. 400@200. 400@100. 500@100. 500@0.}.
	pen := Pen new.
	pen defaultNib:2.
	pen color: Color red.
	pen combinationRule: Form over.
	pen up.
	pen goto:0@100.
	pen down.
	1 to: points size - 3 do:[:i |
		cr := CatmullRom varray: (points copyFrom:i to: i+3) .
		1 to:10 do:[ :j | pen goto: (cr at: j/10.0)].
	].