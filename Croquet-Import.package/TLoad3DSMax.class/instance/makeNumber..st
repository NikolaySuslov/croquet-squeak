parse
makeNumber: string

	| start end substr|
	
	start := 1.
	end := 1.
	
	start := string findDelimiters: '1234567890-.' startingAt: end.
	end := string findDelimiters: (' ',Character tab asString) startingAt: start.
	substr := string copyFrom:start to: end-1.
	^ substr asNumber.
