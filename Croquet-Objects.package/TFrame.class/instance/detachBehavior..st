scripts
detachBehavior: aBehavior
	aBehavior target == nil ifFalse:[
		aBehavior target == self ifFalse:[^self error:'Behavior is not owned by me'].
		^aBehavior detach].
	self myBehaviors: (self myBehaviors copyWithout: aBehavior).