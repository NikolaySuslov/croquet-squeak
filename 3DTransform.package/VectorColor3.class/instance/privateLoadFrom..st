private
privateLoadFrom: srcObject
	| color |
	color := srcObject asColor.
	self red: color red.
	self green: color green.
	self blue: color blue.
	self alpha: color alpha.