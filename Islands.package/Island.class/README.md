Instance variables:
	name 	<String>	The name of this island.
	uid 		<UUID>	The uid of this island.
	globals	<Dictionary>	The named entry points of this island.
	exports	<FarRefMap>	All the exported references from this island.

Documentation:

Islands
========

An island is a unit of isolation for sets of interacting objects. Any object lives on precisely one island and never "leaves" its island. Put differently, no two objects on different islands can refer to each other directly. Instead, objects on different islands refer to each other via so-called "far references" (FarRef) which are well-known objects controlling and relaying the incoming messages to its designated receiver on the correct island.

Installing Islands
--------------------

At this point, islands need to be manually installed since the work isn't finished yet and some optimization are incomplete (leading to significant slowdowns and other odd effects which may be too much for to deal with when you're just trying to get work done).

To install islands execute:

		Island install.

To uninstall islands execute:

		Island uninstall.

Uninstalling islands will remove all previously created islands but should otherwise have no bad effects on your environment (unless, of course, you are playing around inside the islands code itself; then all bets are off ;-) It is therefore safe to install islands, and if something bad happens (and you still have access to a workspace) uninstall them afterwards to restore the system into a functioning state.

Using Islands
---------------

When the islands have been installed, you are already using them since per definition all objects live in an island.

[	"Example: Printing the current island"
	Transcript cr; show: 'We are currently on ', self island printString.
]

By default all objects are created in the current island. If an object needs to be created on a specific island, one can use the #new: message.


[	"Example: Creating an island and an object on the island"
	| island var |
	island := Island named: 'example'.
	var := island new: TestVariable.
	Transcript cr; show: 'This is a ', var printString.
	Transcript cr; show: 'It lives on ', var island printString.
]

The above will print as "Far:[a TestVariable(nil)]" where "Far[...]" indicates that the object is not living on the current island. And although the object is living on a different island, we can send messages to it, for example:

[	"Example: Sending messages to objects on other islands"
	| island var |
	island := Island named: 'example'.
	var := island new: TestVariable.
	var value: 42.
	Transcript cr; show: 'The value of ', var printString,' is now: ', var value.
].

When references to objects are passed forth and back they are converted from and to far references as needed so that an object which is local to the current island remains local even if this reference is passed to another island and (directly or indirectly) returned to "its" island.

[	"Example: Converting between near and far ref"
	| island var |
	island := Island named: 'example'.
	var := island new: TestVariable.

	"Print my point of view"
	Transcript cr; show: 'From here it looks like a '.
	Transcript show: (self island classOf: var).

	"Print the other point of view"
	Transcript cr; show: 'From there it looks like a '.
	Transcript show: (island classOf: var).

	"And the other way around"
	var := TestVariable new. "created in the current island"

	"Print my point of view"
	Transcript cr; show: 'From here it looks like a '.
	Transcript show: (self island classOf: var).

	"Print the other point of view"
	Transcript cr; show: 'From there it looks like a '.
	Transcript show: (island classOf: var).

]

Far refs also preserve identity, e.g., from the point of view of each island there is a unique identity for all objects (though if it is a far reference or not depends on whether the object has been allocated on the island).

[	"Example: Referential identity"
	| island var obj |
	island := Island named: 'example'.
	var := island new: TestVariable.

	"First use a far ref for testing"
	island at: #test put: var.	"set on its island"
	obj := island at: #test. 		"retrieve from its island"
	Transcript cr; show: 'The classes are: ', var class name, ' and ', obj class name.
	Transcript cr; show: 'Are they identical? ', (var == obj) printString.

	"Now use an object which is far on the other island"
	var := TestVariable new. 	"on our island"
	island at: #test put: var.	"store on other island"
	obj := island at: #test.		"retrieve from other island"
	Transcript cr; show: 'The classes are: ', var class name, ' and ', obj class name.
	Transcript cr; show: 'Are they identical? ', (var == obj) printString.

]

We can always ask any object which island it lives on and this of course extends to objects which were implicitly created while executing code on some island.

[	"Example: Printing an object's island"
	| island window |
	island := Island named: 'example'.
	"Create a complex object"
	window := island new: CWindow.
	Transcript cr; show: 'My island is: ', self island.
	Transcript cr; show: 'The window lives on: ', window island.
	Transcript cr; show: 'And its front page: ', window costume frontPage island.
]

[Side bar: Note that because of the implicit creation rule there can be a huge difference between creating an object yourself or having the other object create it. For example, consider the following:

	Object>>inspect
		"Open an inspector on the object"
		^self inspectorClass openOn: self.

	Object inspectorClass
		"Answer the class that should be used to inspect instances of the receiver"
		^Inspector

When we have an object from a different island, executing "object inspect" will create the inspector on the island the object lives on, whereas "object inspectorClass openOn: object" will create the inspector in the island of the sender. As you may expect, the entire system is currently very lazy in this regard and is therefore also quite inefficient]

Passing objects between islands
------------------------------------

So far, we have assumed that all objects live on precisely one island and are referenced exclusively via far refs when they are used from other islands. Sometimes this is awkward since there is some overhead involved in sending messages between the islands and it can be advantageous to simply copy the object to the other island (not preserving any local reference to it).

When objects are being passed between islands, their classes are queried about how they would like their instances to be passed along to another island. This message is called #howToPassAsArgument (and yes, it is a stupid name but I couldn't come up with any better) and the possible responses are:

- #passByProxy:
	Pass the object by converting it from and to far reference (this is the default)

- #passByCopy:
	Pass the object by copying it. All objects referred to by the copied object will be passed depending on their own strategy. For example, an array containing a passByProxy: object would convert this object into a far reference.

- #passByClone:
	Pass the object by cloning it. This is like passByCopy: except that the object may be copied multiple times. passByClone: is more efficient than passByCopy: but has the requirement that the object may not refer back to itself, neither directly nor indirectly via other passByCopy: or passByClone: objects (if it does, infinite recursion will occur).

- #passByIdentity:
	Pass the object along without doing anything to it. This strategy must only be used under very specific circumstances (see below).

[**** TBD: I think we need at least the ability to explicitly pass an object by reference or by copy if a client wishes so. E.g., what I'd like to see here is something like:
	sharedData := Array new: 100.
	farRef fill: sharedData asPassByProxy. 
and possibly the same for asPassByCopy so that we can copy an object just once ****]

More about passByIdentity:
-------------------------------

The passByIdentity: strategy must be used with great care since it allows islands to access these objects concurrently and has the potential to leak references between islands. A "normal user" should never use passByIdentity: but if you have to you must be aware of the following: The rule of thumb is that it is only safe to use passByIdentity: if an object is both immutable and not containing pointers. Because of its immutability there is no problem with concurrently executing code from different islands; because it doesn't contain pointers it cannot leak them. Conceptually, these objects live on all islands at once - you cannot ask (for example) the number 1 which island it is living on (it will just answer the current island).

It can still be safe to have pointers if the object is immutable. In this situation one needs to store a far reference if the object stored is anything but passByIdentity: itself and resolve the value when it is being read - this strategy is used for example by IslandVariables which are passByIdentity: (they have to be since they are referred to from compiled methods and may therefore be implicitly used from different islands).

If the object is both, mutable as well as (potentially) containing pointers one must be aware that these objects can be read and written to concurrently and have to be specifically designed for this task. The only objects for which this is currently true are IslandVariables and they should generally be used as a template for how to make proper passByIdentity: objects if that is needed.

At this point there are also numerous other objects which are passByIdentity: (browse the references to passByIdentity: to find them) and which do not adhere to the above rules. Most importantly, all Classes are passByIdentity: (since otherwise the VM would break) but also certain process-related objects (Process, ProcessorScheduler, ScriptScheduler, Semaphore, Delay) and certain rendering-related objects (BitBlt, StrikeFont, Canvas).

All of these will be cleaned up over time; right now one has to be careful not to abuse any of them.

Checkpointing
----------------

Islands can be checkpointed and restored using the (-->)image segment technology. These checkpoints can be used to create a copy (or mutiple copies) of the checkpointed island.

[	"Example: Checkpointing and restoring an island"
	| island other varA varB data |
	island := Island named: 'example'.
	varA := island new: TestVariable.
	varA value: 'Hello World'.
	island at: #var put: varA. "or else we cannot retrieve it later"

	"Now checkpoint (VERY slow right now)"
	data := Island checkpoint: island.

	"And restore (VERY fast)"
	other := Island resurrect: data.
	varB := other at: #var.

	Transcript cr; show: 'The value of the restored variable is: ', varB value printString.
]

When using the image segment technology it is important to understand about what is known as "out pointers". With islands, "out pointers" are all objects referred to both from the current island and any other island ("shared references"). 

These shared references will include two types of objects: a) passByIdentity: objects which are referred to from the current and some other island and b) far references which refer to the objects being used from other islands. In addition, clients must expect to find all compiler literals in the shared references even if they aren't passByIdentity: (including arrays and strings).

It is the client's responsibility to do something sensible with these shared references, for example deal with how to store passByIdentity: objects on files or how to store/resolve far references to other islands.

[**** TBD: Make it possible for clients to look at far references BEFORE checkpointing so that an informed decision can be made about what to do with them before even attempting to checkpoint. ****]


Static variables (globals, class vars, pools):
---------------------------------------------------

Islands have support for static variables by using IslandVariables instead of associations for class, pool, and global variables. There are however a number of significant drawbacks. In short, the use of static variables should be avoided if at all possible. If they cannot be avoided they should be used for passByIdentity: objects only (numeric constants for example) since those have the least overhead; or alternatively for passByProxy: objects (more overhead than passByIdentity: but still okay). Objects using passByCopy: (or passByClone:) should be avoided since they will indeed force the contents to be copied.

[	"Example: Comparing read/write speed for globals"
	| varA varB timeA timeB count ref copy print |
	timeA := timeB := 0.
	ref := self island. "any passByProxy: object"
	copy := 'Hello World'. "any passByCopy: object -- size matters!!!"
	varA := Association new. "standard assoc"
	varB := IslandVariable new. "island static var"

	print :=[:label| 
		Transcript cr; show: label.
		Transcript show: ' ', timeA, ' ms versus ', timeB, ' ms'.
		Transcript show: ' (', (timeB asFloat / timeA truncateTo: 0.01), ' x slower)'.
	].

	"Writing passByIdentity: objects (2x slower)"
	count := 1000000. Smalltalk garbageCollect.
	timeA := [1 to: count do:[:i| varA value: i]] timeToRun.
	timeB := [1 to: count do:[:i| varB value: i]] timeToRun.
	print value: 'Writing passByIdentity:'. 

	"Reading passByIdentity: objects (3x slower)"
	count := 1000000. Smalltalk garbageCollect.
	timeA := [1 to: count do:[:i| varA value]] timeToRun.
	timeB := [1 to: count do:[:i| varB value]] timeToRun.
	print value: 'Reading passByIdentity:'. 

	"Writing passByProxy: objects (16x slower)"
	count := 100000. Smalltalk garbageCollect.
	timeA := [1 to: count do:[:i| varA value: ref]] timeToRun.
	timeB := [1 to: count do:[:i| varB value: ref]] timeToRun.
	print value: 'Writing passByProxy:'. 

	"Reading passByProxy: objects (10x slower)"
	count := 100000. Smalltalk garbageCollect.
	timeA := [1 to: count do:[:i| varA value]] timeToRun.
	timeB := [1 to: count do:[:i| varB value]] timeToRun.
	print value: 'Reading passByProxy:'. 

	"Writing passByCopy: objects (16x slower)"
	count := 100000. Smalltalk garbageCollect.
	timeA := [1 to: count do:[:i| varA value: copy]] timeToRun.
	timeB := [1 to: count do:[:i| varB value: copy]] timeToRun.
	print value: 'Writing passByCopy:'. 

	"Reading passByCopy: objects ( >100 x slower)"
		"Note: This needs a little hack to simulate reading a global
		from another island. As long as we remain on the same island
		reading is at passByProxy: speed."
		varB value: (Island new asFarRef: copy).
	count := 100000. Smalltalk garbageCollect.
	timeA := [1 to: count do:[:i| varA value]] timeToRun.
	timeB := [1 to: count do:[:i| varB value]] timeToRun.
	print value: 'Reading passByCopy:'. 
]

Incoming message control
------------------------------

Islands can control how they wish to process incoming messages from other islands, e.g., whether they want to respond synchronously or asynchronously, whether to perform message replication of incoming messages etc. To control how incoming messages are processed one needs to create a subclass of both Island and FarRef (say MyIsland and MyFarRef); implement MyIsland>>asFarRef: to answer a MyFarRef which (in its doesNotUnderstand: handler) provides the appropriate mechanism for incoming messages.

[**** TBD: Think about if (and if so how) we would control passing far refs forth and back between third parties. It is possible that an island might hand out different far refs to different islands (this would allow numerous optimizations between well-known kinds of islands) but then we may need to go back to the original island and ask it about a far ref for a specific island. 
	FarRef>>valueOn: and FarRef>>varValueOn: would be the likely places to handle this - we could store the dstIsland here and if it is 'wrong' we'd just ask our island for the correct reference. But this may also need support from FarRefMap etc. ****]

Merging Islands
------------------
TBD. Merging islands is great to create objects from checkpoints which is MUCH faster than creating them from code.

[	"Example: Creating an object from code vs. from checkpoint"
	| island obj data timeA timeB|
	island := Island named: 'example'.
	Smalltalk garbageCollect.
	timeA := [obj := island new: Mines] timeToRun.			"1800 ms"
	island at: #root put: obj.
	data := Island checkpoint: island.
	Smalltalk garbageCollect.
	timeB := [island := Island resurrect: data] timeToRun.	"7 ms (!!!)"
	"(island at: #root) openInWorld." "and yes it works"
	Transcript cr; show: 'Time to create Mines from code: ', timeA.
	Transcript cr; show: 'Time to create Mines from checkpoint: ', timeB.
]

However, using this mechanism for creating objects requires us to be able to merge an island with the island where we'd like the object to be present so this would need to be addressed (and is tricky to the point that it might be faster to just run the code ;-)

Optimizing islands (tips and tricks)
-----------------------------------------

TBD. State the rules for optimizing islands. So far we know:

* Avoid globals like mad except for passByIdenity: - even passByProxy: can be fairly problematic if many objects are being written since they force far refs to be created which has a significant impact on GC (such as Morphic's use of ActiveEvent and friends). Worst case examples are using static arrays of arrays such as used by chess game.

* Avoid sending lots of short-lived passByProxy: objects to other islands (MorphicEvents for example) but rather make make them passByCopy: - managing far refs can be more expensive than copying the object (for small, short-lived objects)

* Avoid extreme multi-dispatching between objects on different islands, e.g., having Morph>>fullDrawOn: call Canvas>>fullDraw: call Morph>>fullDrawOn: etc. can be a killer if the objects live on different islands. For complex operations (such as drawing) consider copying on the demand or caching to avoid round trips.

* Carefully think about who is responsible for creating the object - using the debug halo handle on a Morph created on another island currently creates an inspector on THAT island which means both extra round trips for display/interaction as well as increasing that island (project) size.
