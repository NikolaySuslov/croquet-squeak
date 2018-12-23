render
startStepping

	"My steps alot update cycles to the captive morphic world
	 (indirectly, using the SystemState background task queue.)
	Previously, render: was used to add an 'update' to the background queue,
	but that was expensive when many morphic-worlds are in use,
	and didn't allow much in the way of load tuning."

	rate := self onscreenRate.
	stepping ifFalse:[
		stepping := true.
		(self future: rate) step.
	].