project items
dragProjectView: aProject
	| project projView |
	project := aProject.
	projView := ProjectViewMorph on: project.
	projView setProperty: #teaDropAction toValue: (MessageSend receiver: nil selector: #makeProjectLink: argument: project).
	ActiveHand attachMorph: projView.