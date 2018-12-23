project items
addProject: project

	^self addProject: project 
		clickAction: (MessageSend receiver: self selector: #clickProjectView: argument: project)
		dragAction: (MessageSend receiver: self selector: #dragProjectView: argument: project)
