accessing
processesWithMyAdapterDo: aBlock

 	"find all the processes with aLogging instance with the same adapter as me"
 	
	Process allSubInstancesDo: [ :ea | 
		(ea environmentAt: self class key) ifNotNilDo: [ :log | 
			log adapter == adapter ifTrue: [ aBlock value: ea ]
		]	
	]