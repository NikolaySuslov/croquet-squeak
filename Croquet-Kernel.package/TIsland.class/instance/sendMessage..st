actions
sendMessage: message
	"@@@@@FIXME: We have a potential problem here...sometimes this can be
	reached when the controller is nil, because a snapshot is in progress. There
	is a mutex that is in play during the snapshot, but it is in the controller....so
	we can't reach it. And even if we could, the datapath for sending the message
	is completely independent of the sync...it would just be a meaningless delay.
	Until we can come up with a better plan, we busy wait with a delay until we
	have a controller, then forward the message. We wait 100 ms as that
	seems to be close to a lower limit on the sync time."
	"This is one of those places where I'm not sure how it ever worked for more than
	5 min in a row...."
	"Possible better plans: have farrefs refer to the controller rather than the
	island, or maybe both. Have an islandID->controller lookup table someplace
	public in case the controller ivar is nil "

	| ctrl |
	ctrl := controller.
	[ ctrl isNil ]
		whileTrue: [
			(Delay forMilliseconds: 100) wait.
			ctrl := controller
		].
	^ctrl sendMessage: message
