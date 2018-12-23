message sends
syncSend: aMessage
	^self syncSend: aMessage selector withArguments: aMessage arguments