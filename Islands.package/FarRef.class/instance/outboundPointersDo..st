tracing
outboundPointersDo: aBlock
"do aBlock for every object I point to, exactly how the garbage collector would. Adapted from PointerFinder >> #followObject:"

	aBlock value: FarRef.
	aBlock value: myIsland.
	aBlock value: myValue.
