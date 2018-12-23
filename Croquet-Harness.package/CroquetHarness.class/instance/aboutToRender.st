render
aboutToRender

	"This is an extension hook for subclasses.
      Called in each render cycle, after avatar/camera position update 
	 and just before the render: treewalk of the visible frame tree.
	 It is called during the locked-down phase of render,
	 so methods should be quick and may not change the replicated state.
	 (Originally used to update the avatar's OpenAL listener position
	 in the audio harness to match the avatar's current spatial position.)"

	self signal: #aboutToRender.