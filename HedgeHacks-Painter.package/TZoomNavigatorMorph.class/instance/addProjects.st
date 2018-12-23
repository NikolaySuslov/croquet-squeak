project items
addProjects
	self addBackButton: #projects.
	(Project allInstances sort:[:p1 :p2| p1 name <= p2 name]) do:[:prj| self addProject: prj. ].
	targetHeight := nil.