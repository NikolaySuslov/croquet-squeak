menus
messagesMenu: aMenu
	"^ aMenu 
		labels: 'Do not log this class
Only log this class'
		lines: #()
		selections: #(removeClass onlyThisClass)"
	^ aMenu 
		labels: 'Clear all messages
Clear all messages before this one
', (self pauseResumeState ifTrue: ['Resume'] ifFalse: ['Pause'])
		lines: #(2)
		selections: #(clearMessages clearToThisMessage pauseResume)