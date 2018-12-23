filterBlock

	self filterBlock: [ :level :category |  #(#error #debug #info) includes: level ]

example:

The transcript logs all data, the file logs only non temp messages.
	
thisLogInitialize: adapters

	^ adapters 
		addTranscript; 
		add: (LogAdaptersSet new 
				addFileLog: 'logs/', self class name, '.log';
				filterBlock: [ :l :c | l ~= #temp ];
				yourself);
		yourself
					