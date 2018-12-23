*Croquet-Kernel
futureSend: aSelector at: deltaMSecs args: args
	"As an interim measure we will not allow internal future messages to create promises. It is *not* certain if that's the right thing to do or not but it avoids some nasty representation issues, such as the magical conversion from promise to value. For external futures this is okay because the promise is represented as far ref and resolving it simply fills in the value but for internal futures we would need an extra promise representation (TPromise comes to mind) which needs to be resolved explicitly (e.g., via become: or so). Since this is ugly we will try to avoid it."
	^self futureDo: aSelector at: deltaMSecs args: args

"The old code:
	| msgSend promise id |
	promise := TPromise new.
	promise id: (id := (TObjectID for: 'Promise').
	promise island: Processor activeIsland.
	promise register.
	promise runScript: #onResolved: when:{Processor activeIsland. id asSymbol}.
	msgSend := (TMessageSend new)
		receiver: self;
		selector: aSelector;
		arguments: args.
	msgSend id: id.
	Processor activeIsland scheduleMessage: msgSend future: deltaMSecs.
	^promise
"