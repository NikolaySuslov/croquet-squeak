primitives
primSwapBuffers: aHandle
	"Primitive. Finish all rendering operations on the receiver.
	Do not return before all rendering operations have taken effect."
	<primitive: 'primitiveSwapRendererBuffers' module:'B3DAcceleratorPlugin'>
	^nil