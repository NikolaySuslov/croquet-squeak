accessing
boundsChanged
	super boundsChanged.

	"I'm not sure of the intended semantics of 'frameChanged'... TPrimitive set it in #boundsChanged, and I've decided to do the same here (it fixes a bug)."
	self flag: #jcg.
	frameChanged := true.

	changed := true.