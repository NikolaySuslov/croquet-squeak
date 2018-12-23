instance creation
makeProjectLink: projName extent: worldExtent from: tform
	| host project |
	project := Project named: projName.
	project ifNil:[^nil].
	host := self new initializeWithProject: project thumb: tform extent: worldExtent.
	host redraw.
	TMorphicForm registerHost: host.