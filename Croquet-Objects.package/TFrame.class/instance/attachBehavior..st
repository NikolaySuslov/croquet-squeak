scripts
attachBehavior: aBehavior
	aBehavior target == self ifFalse:[^aBehavior attachTo: self].
	self myBehaviors: (self myBehaviors copyWith: aBehavior).