hierarchy
insertFrame: frm

	| parent |
" Insert this frame between the target frame and its parent. "
	
	self parent ifNotNil:[
		parent := self parent.
		parent removeChild: self.
		parent addChild: frm.
		].
	frm addChild: self.
